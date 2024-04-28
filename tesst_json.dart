import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
 final int id;
 final String f_name;
 final String l_name;
 final String email;

  User(this.id, this.f_name, this.l_name, this.email);

  User.fromJson(Map<String, dynamic> m):
       id = m['id'],
        f_name = m['f_name'],
        l_name = m['l_name'],
        email = m['email'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'f_name': f_name,
        'l_name': l_name,
        'email': email,
      };
      
  @override
  String toString(){
    return "$id|$f_name|$l_name|$email";
  }

}

void main () async {
  final  url = 'webcode.me';
  final path = '/users.json';
  final resp = await http.get(Uri.http(url,path));
  List<dynamic> data =json.decode(resp.body)['users'] ;
  List<User> users = List<User>.from(data.map<User>((dynamic e) => User.fromJson(e)));
 
  print(users);
}
