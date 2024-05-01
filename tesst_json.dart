import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String? first_name;
  final String? last_name;
  final String? email;

  User(this.id, this.first_name, this.last_name, this.email);

  User.fromJson(Map<String, dynamic> m)
      : id = m['id'],
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
  String toString() {
    return "$id|$first_name|$last_name|$email";
  }
}

void main() async {
  final url = 'webcode.me';
  final path = '/users.json';

 exception exc = exception();
 exc.fetch_data(url,path);
  
}

class exception {
Future<void> fetch_data(String url,String path) async{
    try {
      final resp = await http.get(Uri.http(url, path));
    
      if (resp.statusCode == 200) {
        List<dynamic> data = json.decode(resp.body)['users'];
        List<User> users =
            List<User>.from(data.map<User>((dynamic e) => User.fromJson(e)));
        print(users[0]);
        print('encode: ${json.encode(users[0])}');
      } else {
        print('Failed to load data: ${resp.statusCode}');
      }
    }on SocketException catch  (e) {
      print('an internet error occurred: $e');
    }on HttpException catch(e){
      print('an error occurred in the url address: $e');
    }on FormatException catch(e){
      print('a data format error occurred: $e');
    }catch(e){
      print('something went wrong : $e');
    }
  }
  
}
