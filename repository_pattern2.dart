import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class UserRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users/';

  Future<List<dynamic>> fetchData(int numberOfRequests) async {
    List<Future<dynamic>> requests = [];

    for (int i = 1; i <= numberOfRequests; i++) {
      requests.add(makeApiRequest(i));
    }

    return await Future.wait(requests);
  }

  Future<dynamic> makeApiRequest(int requestId) async {
    try {
     var response = await http.get(Uri.parse('$apiUrl$requestId/'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } 
    }on HttpException {
     print('http excption : $apiUrl');
    }on FormatException{
      print('Bad response format from:$apiUrl');
    }on TimeoutException{
      print('Request timed out for: $apiUrl');
    }catch (e){
      print('**** error **** : $e');
    }
  }
}

void main() async {
  var userRepository = UserRepository();

  try {
    var data = await userRepository.fetchData(10);

    data.forEach((response) {
      print(response);
    });
  } catch (e) {
    print('Error: $e');
  }
}
