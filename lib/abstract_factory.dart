abstract class Item {
  String get title;
  String get type;
}

class Book implements Item {
  final String title;

  Book(this.title);

  @override
  String get type => "Book";
}

class Audiobook implements Item {
  final String title;

  Audiobook(this.title);

  @override
  String get type => "Audiobook";
}

abstract class ItemFactory {
  Item createItem(String type, String title);
}

class BookFactory implements ItemFactory {
  @override
  Item createItem(String type, String title) {
    if (type == "Book") {
      return Book(title);
    } else {
      throw Exception("Invalid item type");
    }
  }
}

// Similar implementations for AudiobookFactory and potentially others
