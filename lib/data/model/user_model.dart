class UserModel {
  late String? name;
  late String? email;
  late String? phone;
  late String? uId;
  late List<String> favourites;
  late List<String> cards;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.uId,
    this.cards = const [],
    this.favourites = const [],
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    email = json?['email'];
    name = json?['name'];
    phone = json?['phone'];
    uId = json?['uId'];
    favourites = json?['favourites'];
    cards = json?['cards'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'favourites': favourites,
      'cards': cards,
    };
  }
}
