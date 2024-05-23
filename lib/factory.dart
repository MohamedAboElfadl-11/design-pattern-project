abstract class User {
  String get name;
  String get type;
}

class Patron implements User {
  final String name;

  Patron(this.name);

  @override
  String get type => "Patron";
}

class Librarian implements User {
  final String name;

  Librarian(this.name);

  @override
  String get type => "Librarian";
}

class UserFactory {
  static User createUser(String type, String name) {
    switch (type) {
      case "Patron":
        return Patron(name);
      case "Librarian":
        return Librarian(name);
      default:
        throw Exception("Invalid user type");
    }
  }
}
