import 'dart:async';

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
      default:
        return 'An error occurred while fetching data from: $url';
    }
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
    });

  customHandler.fetchData('https://examlkple.com/invalid-url')
    .then((result) {
      print(result);
    })
    .catchError((error) {
      print('Error: $error');
    });
}
