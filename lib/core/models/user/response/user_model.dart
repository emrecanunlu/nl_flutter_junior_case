import 'package:jr_case_boilerplate/core/base/base_model.dart';

/* "_id": "67bc8d58d9ec4d40040b81b6",
    "id": "67bc8d58d9ec4d40040b81b6",
    "name": "safa",
    "email": "safa@nodelabs.com",
    "photoUrl": "https://cdn.jannahconnect.com/amore/testdata/1757620468843-jfbsoa.jpg",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2N2JjOGQ1OGQ5ZWM0ZDQwMDQwYjgxYjYiLCJpZCI6IjY3YmM4ZDU4ZDllYzRkNDAwNDBiODFiNiIsIm5hbWUiOiJzYWZhIiwiaWF0IjoxNzU3NjM2OTQzLCJleHAiOjQ4NjgwMzY5NDN9.R9sm4VPLedVtsIR5jAxp5bILrIAcUr4PhwfxfAXUhf8" */

class UserModel extends BaseModel<UserModel> {
  String id;
  String name;
  String email;
  String photoUrl;
  String token;

  UserModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.photoUrl = '',
    this.token = '',
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      token: json['token'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'token': token,
    };
  }
}
