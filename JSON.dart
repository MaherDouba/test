import 'dart:convert';

class User {
  String name;
  String gob;

  User(this.name, this.gob);

  User.fromJson(Map<String, dynamic> m)
      : name = m['name'],
        gob = m['gob'];
  
  Map<String, dynamic> toJson() => {'name': name, 'gob': gob};

  @override
  String toString() {
    return "$name | $gob";
  }
}

void main() {
  String u1json = '{"name":"ali" , "gob":"doctor"}';
  final u1 = User.fromJson(json.decode(u1json));
  final u11 = User.fromJson(jsonDecode(u1json));
  print(u1);
  print('jsondecode:  $u11');

  User u2 = User('mohammad', 'student');
  print(u2);
  String u2json = json.encode(u2);
  print(u2json);
}
