import 'dart:async';
import 'dart:io';

class Exception_han {
  Future<String> check_url(String url) async {
    return Future.delayed(Duration(seconds: 1), () {

      if (url == 'https://example.com/data') {
        return 'Data fetched successfully';
      } else {
        throw Exception('Failed to fetch data');
      }
    });
  }

  Future<String> fetchData(String url) {
    return Future.sync(() => check_url(url)).catchError((error) {
      return handleException(error, url);
    });
  }

  String handleException(dynamic error, String url) {
    switch (error) {
      case FormatException:
        return 'Bad response format from: $url';
      case TimeoutException:
        return 'Request timed out for: $url';
      case HttpException:
        return 'http excption $url';
      default:
        return 'An error occurred while fetching data from: $url';
    }
  }
}
Future<String> loading(Future<String> func()) async {
  print("Loading...");
  try {
    String result = await func();
    print("Load complete!");
    return 'result: $result';
  } catch (error) {
    print('Error occurred during loading: $error');
    return 'Error occurred during loading';
  }
}

void main() {
  Exception_han customHandler = Exception_han();

  customHandler.fetchData('https://example.com/data')
    .then((result) {
      print(result);
    })
    .catchError((error) {
      print('Error: $error');
    }).then((_) => loading(() => customHandler.fetchData('https://example.com/data')));

  customHandler.fetchData('https://examlkple.com/invalid-url')
    .then((result) {
      print(result);
    })
    .catchError((error) {
      print('Error: $error');
    });
}
