class AppUser {
  String Username;

  String phone;
  String? id;
  String city;
  String email;
  AppUser(
      {required this.Username,
      required this.email,
      this.id,
      required this.phone,
      required this.city});
  Map<String, dynamic> toMap() {
    return {"email": email, "name": Username, "phone": phone, "city": city};
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
        Username: map["Username"],
        email: map["email"],
        phone: map["phone"],
        city: map["city"]);
  }
}
