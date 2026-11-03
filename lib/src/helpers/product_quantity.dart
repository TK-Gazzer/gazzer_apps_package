// Self-contained (pure Dart, no app imports) so it can be copied to other apps.
//
// Backend fields:
//   "quantity_type": "unit" | "weight"
//   "weight_unit":   "g" | "kg"
//   "unit_weight":   25

enum QuantityType {
  unit('unit'),
  weight('weight');

  final String value;
  const QuantityType(this.value);

  static QuantityType fromString(String? value) {
    return QuantityType.values.firstWhere(
      (e) => e.value == value?.toLowerCase(),
      orElse: () => QuantityType.unit,
    );
  }
}

enum WeightUnit {
  g('g'),
  kg('kg');

  final String value;
  const WeightUnit(this.value);

  static WeightUnit? fromString(String? value) {
    for (final e in WeightUnit.values) {
      if (e.value == value?.toLowerCase()) return e;
    }
    return null;
  }
}

/// Display texts; pass localized values from the host app.
class QuantityLabels {
  final String piece;
  final String gram;
  final String kilogram;
  final String currency;

  const QuantityLabels({
    required this.piece,
    required this.gram,
    required this.kilogram,
    required this.currency,
  });

  static const en = QuantityLabels(piece: 'piece', gram: 'g', kilogram: 'kg', currency: 'EGP');
  static const ar = QuantityLabels(piece: 'قطعة', gram: 'جرام', kilogram: 'كجم', currency: 'جنيه');

  String unitLabel(WeightUnit unit) => switch (unit) {
        WeightUnit.g => gram,
        WeightUnit.kg => kilogram,
      };
}

class ProductQuantity {
  final QuantityType type;
  final WeightUnit? weightUnit;
  final num? unitWeight;
  final num? totalWeight;

  const ProductQuantity({
    this.type = QuantityType.unit,
    this.weightUnit,
    this.unitWeight,
    this.totalWeight,
  });

  factory ProductQuantity.fromJson(Map<String, dynamic> json) {
    final weightUnit = WeightUnit.fromString(json['weight_unit'] as String?);
    final rawType = json['quantity_type'] as String?;
    final type = rawType != null
        ? QuantityType.fromString(rawType)
        : (weightUnit != null ? QuantityType.weight : QuantityType.unit);

    return ProductQuantity(
      type: type,
      weightUnit: weightUnit,
      unitWeight: _parseNum(json['unit_weight']),
      totalWeight: _parseNum(json['total_weight']),
    );
  }

  static num? _parseNum(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    return num.tryParse(value.toString());
  }

  Map<String, dynamic> toJson() => {
        'quantity_type': type.value,
        'weight_unit': weightUnit?.value,
        'unit_weight': unitWeight,
        'total_weight': totalWeight,
      };

  bool get isUnit => type == QuantityType.unit || weightUnit == null;

  /// e.g. `500 g`, `1 kg` based on [totalWeight]
  String? totalWeightLabel([QuantityLabels labels = QuantityLabels.en]) {
    if (totalWeight == null || weightUnit == null) return null;
    return '${formatNumber(totalWeight!)} ${labels.unitLabel(weightUnit!)}';
  }

  /// Smart amount label for an ordered item.
  ///
  /// - Unit items  → `"5 قطعة"` / `"5 piece"`
  /// - Weight items (uses [totalWeight] when available, otherwise
  ///   `unitWeight × cartQty`):
  ///     < 1000 g  → `"500 جرام"` / `"500 g"`
  ///     ≥ 1000 g  → `"1.5 كجم"` / `"1.5 kg"`
  String? orderItemAmountLabel(
    int cartQuantity, {
    QuantityLabels labels = QuantityLabels.en,
  }) {
    if (isUnit) {
      // e.g. "5 قطعة"
      return '$cartQuantity ${labels.piece}';
    }

    // ── weight branch ──────────────────────────────────────────
    // Prefer the pre-computed total_weight from the API.
    // Fall back to unitWeight × cartQty if total_weight is absent.
    final rawGrams = _resolvedTotalGrams(cartQuantity);
    if (rawGrams == null) return null;

    if (rawGrams < 1000) {
      // Show in grams
      return '${formatNumber(rawGrams)} ${labels.gram}';
    } else {
      // Convert to kg
      final kg = rawGrams / 1000;
      final kgFormatted = kg % 1 == 0
          ? kg.toInt().toString()
          : kg.toStringAsFixed(3).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
      return '$kgFormatted ${labels.kilogram}';
    }
  }

  /// Resolves the total weight in the **base unit stored by the API**.
  ///
  /// If [weightUnit] is `kg` the stored values are already in kg, so we
  /// convert to grams for the threshold comparison.
  num? _resolvedTotalGrams(int cartQuantity) {
    // Prefer calculating unitWeight * cartQuantity dynamically if unitWeight exists;
    // otherwise fall back to totalWeight from API.
    final rawTotal = (unitWeight != null ? unitWeight! * cartQuantity : null) ?? totalWeight;
    if (rawTotal == null || weightUnit == null) return null;

    // Normalise to grams so the 1000-gram threshold always works
    return weightUnit == WeightUnit.kg ? rawTotal * 1000 : rawTotal;
  }

  /// e.g. `123 EGP / 5 قطعة`, `123 EGP / 500 جرام`, `123 EGP / 1.5 كجم`
  ///
  /// Like [priceLabel] but replaces the unit-per-piece label with the actual
  /// ordered quantity so the right side reads `price / quantity`.
  String orderPriceLabel(
    num price,
    int cartQuantity, {
    QuantityLabels labels = QuantityLabels.en,
    bool showCurrency = true,
  }) {
    final priceText = formatPrice(price) + (showCurrency ? ' ${labels.currency}' : '');
    final amtLabel = orderItemAmountLabel(cartQuantity, labels: labels);
    if (amtLabel == null) return priceText;
    return '$priceText / $amtLabel';
  }

  /// e.g. `123 EGP / 50 g`, `123 EGP / 1 kg`, `123 EGP / piece`
  String quantityLabel([QuantityLabels labels = QuantityLabels.en]) {
    if (isUnit) return labels.piece;
    return '${formatNumber(unitWeight ?? 1)} ${labels.unitLabel(weightUnit!)}';
  }

  /// e.g. `123 EGP / 50 g`, `123 EGP / 1 kg`, `123 EGP / piece`
  /// [hideUnitForPiece] drops the `/ piece` suffix: `123 EGP`
  String priceLabel(
    num price, {
    QuantityLabels labels = QuantityLabels.en,
    bool showCurrency = true,
    bool hideUnitForPiece = false,
  }) {
    final priceText = formatPrice(price) + (showCurrency ? ' ${labels.currency}' : '');
    // if (isUnit && hideUnitForPiece) return priceText;
    return '$priceText / ${quantityLabel(labels)}';
  }

  static String formatPrice(num price) =>
      price % 1 == 0 ? price.toStringAsFixed(0) : price.toStringAsFixed(1);

  static String formatNumber(num number) =>
      number % 1 == 0 ? number.toInt().toString() : number.toString();
}
