class NewOrderItemVariation {
  String? label;
  int? qty;
  List<NewOrderItemVariation>? values;

  NewOrderItemVariation({this.label, this.qty, this.values});

  NewOrderItemVariation.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    qty = json['quantity'];
    if (json['values'] != null) {
      values = <NewOrderItemVariation>[];
      json['values'].forEach((v) {
        values!.add(NewOrderItemVariation.fromJson(v));
      });
    }
  }
}

final variationsFake = [
  NewOrderItemVariation(label: 'Color', qty: 2, values: [
    NewOrderItemVariation(label: 'Red1', qty: 5, values: [
      NewOrderItemVariation(label: 'Red2', qty: 4, values: [
        NewOrderItemVariation(label: 'Small', qty: 10),
        NewOrderItemVariation(label: 'Medium', qty: 20),
        NewOrderItemVariation(label: 'Large', qty: 30),
      ]),
      NewOrderItemVariation(label: 'Green', qty: 1),
      NewOrderItemVariation(label: 'Blue', qty: 5),
    ]),
  ]),
  NewOrderItemVariation(label: 'Size', values: [
    NewOrderItemVariation(label: 'Small', qty: 10),
    NewOrderItemVariation(label: 'Medium', qty: 20),
    NewOrderItemVariation(label: 'Large', qty: 30),
  ]),
];
