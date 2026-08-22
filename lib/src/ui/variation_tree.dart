import 'package:flutter/material.dart';
import '../models/new_order_item_variation.dart';
import 'qty_badge.dart';

/// Renders a variation tree of arbitrary depth, indenting each level
/// under a connecting left border — same pattern regardless of how
/// deep the nesting goes.
class VariationTree extends StatelessWidget {
  final List<NewOrderItemVariation> variations;
  final int depth;
  final bool showVariations;
  const VariationTree({
    super.key,
    required this.variations,
    this.depth = 0,
    this.showVariations = true,
  });

  @override
  Widget build(BuildContext context) {
    if (showVariations != true) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: variations.map((v) => _node(context, v)).toList(),
    );
  }

  Widget _node(BuildContext context, NewOrderItemVariation v) {
    final hasChildren = v.values != null && v.values!.isNotEmpty;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              v.label ?? '',
              style: TextStyle(
                fontSize: depth == 0 ? 14 : 13,
                fontWeight: depth == 0 ? FontWeight.w500 : FontWeight.w400,
                color: hasChildren && depth > 0
                    ? Colors.grey.shade500
                    : Colors.black87,
              ),
            ),
            if (!hasChildren && v.qty != null) QtyBadge(qty: v.qty!),
          ],
        ),
        if (hasChildren)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: VariationTree(variations: v.values!, depth: depth + 1),
          ),
      ],
    );

    if (depth == 0) {
      return Padding(padding: const EdgeInsets.only(bottom: 4), child: content);
    }

    return Container(
      margin: const EdgeInsets.only(left: 6, bottom: 4),
      padding: const EdgeInsets.only(left: 12, top: 2, bottom: 2),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: content,
    );
  }
}
