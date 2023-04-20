class Order {
  String name;
  String phone;
  String address;
  double total;
  List<Product> products;

  Order({required this.name, required this.phone, required this.address, required this.total, required this.products});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'total': total,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  String title;
  double price;

  Product({required this.title, required this.price});

  Map<String, dynamic> toJson() {
    return {'title': title, 'price': price};
  }
}
