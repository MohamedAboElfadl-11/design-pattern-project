// Subject Interface
abstract class LibrarySubject {
  void registerObserver(LibraryObserver observer);
  void removeObserver(LibraryObserver observer);
  void notifyObservers();
}

// Concrete Subject
class Library implements LibrarySubject {
  final List<LibraryObserver> _observers = [];
  final Map<String, Book> _books = {};

  void addBook(String title, Book book) {
    _books[title] = book;
    notifyObservers();
  }

  void removeBook(String title) {
    _books.remove(title);
    notifyObservers();
  }

  @override
  void registerObserver(LibraryObserver observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(LibraryObserver observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (final observer in _observers) {
      observer.update(_books);
    }
  }
}

// Observer Interface
abstract class LibraryObserver {
  void update(Map<String, Book> books);
}

// Concrete Observer
class LibraryUser implements LibraryObserver {
  final String name;
  final List<Book> borrowedBooks = [];

  LibraryUser(this.name);

  @override
  void update(Map<String, Book> books) {
    final availableBooks =
        books.values.where((book) => !book.isBorrowed).toList();
    if (availableBooks.isNotEmpty) {
      final book = availableBooks.first;
      borrowBook(book);
    }
  }

  void borrowBook(Book book) {
    book.borrow();
    borrowedBooks.add(book);
    print('$name borrowed the book: ${book.title}');
  }

  void returnBook(Book book) {
    book.return_();
    borrowedBooks.remove(book);
    print('$name returned the book: ${book.title}');
  }
}

// Book class
class Book {
  final String title;
  bool _isBorrowed = false;

  Book(this.title);

  bool get isBorrowed => _isBorrowed;

  void borrow() {
    _isBorrowed = true;
  }

  void return_() {
    _isBorrowed = false;
  }
}

void main() {
  final library = Library();
  final user1 = LibraryUser('Alice');
  final user2 = LibraryUser('Bob');

  library.registerObserver(user1);
  library.registerObserver(user2);

  library.addBook('The Great Gatsby', Book('The Great Gatsby'));
  library.addBook('To Kill a Mockingbird', Book('To Kill a Mockingbird'));

  user1.borrowBook(library._books['The Great Gatsby']!);
  user2.borrowBook(library._books['To Kill a Mockingbird']!);

  library.removeBook('The Great Gatsby');
}
