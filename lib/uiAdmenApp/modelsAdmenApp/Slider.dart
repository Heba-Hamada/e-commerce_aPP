class Sliders {
  String? catId;

  late String ImageUrl;
  Sliders({required this.ImageUrl, this.catId});
  Sliders.fromMap(Map<String, dynamic> map) {
    ImageUrl = map["ImageUrl"];
  }

  toMap() {
    return {
      "ImageUrl": ImageUrl,
    };
  }
}
