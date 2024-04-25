abstract class Human {
  void printInfo();
}

class Employee implements Human {
  String name;
  int age;
  String jobTitle;

  Employee(this.name, this.age, this.jobTitle){
    print("from constructor employee");
  }

  @override
  void printInfo() {
    print('Name: $name, Age: $age');
  }

  void printJobTitle() {
    print('Job Title: $jobTitle');
  }
}

class Manager implements Human {
  String name;
  int age;
  String department;

  Manager(this.name, this.age, this.department);

  @override
  void printInfo() {
    print('Name: $name, Age: $age');
  }

  void printDepartment() {
    print('Department: $department');
  }
}

class Animal {
  String species;
  int age;

  Animal(this.species, this.age);

  void printInfo() {
    print('Species: $species, Age: $age');
  }
}

class WildAnimal extends Animal {
  String habitat;

  WildAnimal(String species, int age, this.habitat) : super(species, age);
}

extension wildanimalclass on WildAnimal {
  void printHabitat() {
    print('Habitat: $habitat');
  }
}

extension ex_string on String {
  String capital() {
    return this.substring(0, 1).toUpperCase() + this.substring(1);
  }
}

void main() {
  String val = 'start main';
  String val2 = 'end main';

  print(val.capital());
  Employee employee = Employee('ali', 25, 'Software Engineer');
  employee.printInfo();
  employee.printJobTitle();

  Manager manager = Manager('issa', 40, 'HR');
  manager.printInfo();
  manager.printDepartment();

  WildAnimal lion = WildAnimal('Lion', 5, 'Savannah');
  lion.printInfo();
  lion.printHabitat();

  print(val2.capital());
}
