import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;

  User(this.id, this.name);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['name']);
  }
}

class UserRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users/';

  Future<List<User>> getAllUsers() async {
    List<User> users = [];

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        users = List<User>.from(data.map((user) => User.fromJson(user)));
      } else {
        throw Exception('Failed to load users');
      }
    } on HttpException {
     print('http excption $apiUrl');
    }

    return users;
  }

  Future<void> addUser(User user) async {
    try {
      var response = await http.post(Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'id': user.id, 'name': user.name}));

      if (response.statusCode != 201) {
        throw Exception('Failed to add user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      var deleteUrl = Uri.parse('$apiUrl/$userId');
      var response = await http.delete(deleteUrl);

      if (response.statusCode != 200) {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

void main() async {
  var userRepository = UserRepository();

  try {
    var users = await userRepository.getAllUsers();

    print('list of user :');
    users.forEach((user) {
      print('${user.id}: ${user.name}');
    });

    // add user
    var newUser = User(4, 'sara');
    await userRepository.addUser(newUser);
    print('user added : ${newUser.name}');

    // delete usser
    var userIdToDelete = 2;
    await userRepository.deleteUser(userIdToDelete);
    print('user has been delete $userIdToDelete');
  } catch (e) {
    print('error :  $e');
  }
}
