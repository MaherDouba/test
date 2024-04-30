import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String name;
  final String email;

  User( this.id, this.name,this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [id, name, email];
}

void main() {

  Map<String, dynamic> json = {
    "id": 1,
    "name": "ali",
    "email": "ali.dou@example.com"
  };

  User user1 = User.fromJson(json);
  User user2 = User.fromJson(json);

  print("User 1: $user1");
  print("User 2: $user2");

  if (user1 == user2) {
    print("User 1 and User 2 are equal.");
  } else {
    print("User 1 and User 2 are not equal.");
  }

  
  print("User object as JSON: ${user1.toJson()}");
}
