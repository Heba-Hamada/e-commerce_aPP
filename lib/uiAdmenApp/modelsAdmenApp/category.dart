class Category {
  late String catId;

  late String name;
  late String ImageUrl;
  Category({required this.name, required this.ImageUrl});

  Category.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    ImageUrl = map["ImageUrl"];
  }

  toMap() {
    return {
      "name": name,
      "ImageUrl": ImageUrl,
    };
  }
}
