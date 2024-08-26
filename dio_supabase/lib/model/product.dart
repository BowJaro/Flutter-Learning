class MyProduct {
  final String id;
  final String name;
  final int quantity;

  MyProduct({required this.id, required this.name, required this.quantity});

  factory MyProduct.fromJson(Map<String, dynamic> json) {
    return MyProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
      };
}
