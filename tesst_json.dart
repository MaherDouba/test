import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
 final int id;
 final String? first_name;
 final String? last_name;
 final String? email;

  User(this.id, this.first_name, this.last_name, this.email);

  User.fromJson(Map<String, dynamic> m):
       id = m['id'],
        first_name = m['first_name'],
        last_name = m['last_name'],
        email = m['email'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
      };
      
  @override
  String toString(){
    return "$id|$first_name|$last_name|$email";
  }

}

void main () async {
  final  url = 'webcode.me';
  final path = '/users.json';
  final resp = await http.get(Uri.http(url,path));
  List<dynamic> data =json.decode(resp.body)['users'] ;
  List<User> users = List<User>.from(data.map<User>((dynamic e) => User.fromJson(e)));
 
  print(users[0]);
  print('encode: ${json.encode(users[0])}');
}
