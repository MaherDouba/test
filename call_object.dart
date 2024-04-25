var calculator = {
  'add': (int a, int b) => a + b,
  'subtract': (int a, int b) => a - b,
  'multiply': (int a, int b) => a * b,
  'divide': (int a, int b) => a ~/ b,
};
void main() {
  print(calculator['add']!(5, 3));
  print(calculator['subtract']!(10, 4));
  print(calculator['multiply']!(2, 6));
  print(calculator['divide']!(15, 3));

  print('My name is ${person['name']}');
}

var person = {
  'name': 'Ali',
  'age': 25,
  'isStudent': true,
  'introduction': (Map<String, dynamic> person) {
    print('My name is ${person['name']}');
    print('I am ${person['age']} years old');
    if (person['isStudent']) {
      print('I am a student');
    } else {
      print('I am not a student');
    }
  },
};
