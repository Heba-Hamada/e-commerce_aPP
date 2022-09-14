class Prodect {
  String? id;
  late String name;
  late String description;
  late num price;
  late int quantity;
  late String image;

  Prodect(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.image,
      this.id});

  Prodect.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    id = map["id"];
    image = map["image"];
    description = map["description"];
    price = map["price"];
    quantity = map["quantity"];
  }

  toMap() {
    return {
      "id": id,
      "image": image,
      "name": name,
      "description": description,
      "price": price,
      "quantity": quantity,
    };
  }
}
