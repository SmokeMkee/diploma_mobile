import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  final String? birthdate;
  final String? city;
  final String? country;
  final String? email;
  final String? fullName;
  final int? id;
  final String? name;
  final String? patronymic;
  final String? phone;
  final String? photo;
  final String? photoContentType;
  final String? photoName;
  final String? street;
  final String? surname;
  final User? user;

  Profile({
    this.birthdate,
    this.city,
    this.country,
    this.email,
    this.fullName,
    this.id,
    this.name,
    this.patronymic,
    this.phone,
    this.photo,
    this.photoContentType,
    this.photoName,
    this.street,
    this.surname,
    this.user,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    birthdate: json["birthdate"],
    city: json["city"],
    country: json["country"],
    email: json["email"],
    fullName: json["fullName"],
    id: json["id"],
    name: json["name"],
    patronymic: json["patronymic"],
    phone: json["phone"],
    photo: json["photo"],
    photoContentType: json["photoContentType"],
    photoName: json["photoName"],
    street: json["street"],
    surname: json["surname"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "birthdate": birthdate,
    "city": city,
    "country": country,
    "email": email,
    "fullName": fullName,
    "id": id,
    "name": name,
    "patronymic": patronymic,
    "phone": phone,
    "photo": photo,
    "photoContentType": photoContentType,
    "photoName": photoName,
    "street": street,
    "surname": surname,
    "user": user?.toJson(),
  };
}

class User {
  final String? email;
  final int? id;
  final bool? isActive;
  final String? password;
  final String? userType;

  User({
    this.email,
    this.id,
    this.isActive,
    this.password,
    this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    id: json["id"],
    isActive: json["isActive"],
    password: json["password"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "isActive": isActive,
    "password": password,
    "userType": userType,
  };
}
