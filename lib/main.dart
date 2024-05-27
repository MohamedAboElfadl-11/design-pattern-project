import 'dart:io';

import 'abstract_factory.dart';
import 'decorator .dart';
import 'factory.dart';
import 'adapter.dart';
import 'singleton.dart';

void main() {
  print("Library System Design Patterns");
  print("1. Configuration Manager (Singleton)");
  print("2. User Factory");
  print("3. Abstract Item Factory");
  print("4. Decorator (Fines)");
  print("5. Adapter (Legacy Data Import)");
  print("6. Observer (push notification)");
  print("Enter your choice (1-6): ");

  int choice = int.parse(stdin.readLineSync()!); // Read user input

  switch (choice) {
    case 1:
      ConfigurationManager config = ConfigurationManager();
      int maxBorrowingLimit = config.getMaxBorrowingLimit;
      double lateFeePerDay = config.getLateFeePerDay;
      int renewalPeriod = config.getRenewalPeriod;
      // Access Configuration Manager instance (Singleton)
      print("Max borrowing limit: ${maxBorrowingLimit} Books");
      print("Late fee per day: ${lateFeePerDay} \$");
      print("Renewal period: ${renewalPeriod} days");
      break;
    case 2:
      // User Factory
      User user = UserFactory.createUser("Patron", "John Doe");
      print(user.name);
      print(user.type);
      break;
    case 3:
      // Abstract Item Factory
      ItemFactory factory = BookFactory();
      Item book =
          factory.createItem("Book", "The Hitchhiker's Guide to the Galaxy");
      print(book.title);
      print(book.type);
      break;
    case 4:
      // Decorator (Fines)
      Fine baseFine = BaseFine();
      double fine = baseFine.calculateFine(10); // Default calculation

      print("Base fine for 10 overdue days: \$$fine");

      ReplacementCostDecorator decoratedFine =
          ReplacementCostDecorator(baseFine);
      fine = decoratedFine.calculateFine(12); // With replacement cost check

      print("Fine with replacement cost check for 12 overdue days: \$$fine");
      break;
    case 5:
      // Adapter (Legacy Data Import) - Example with simplified data
      List<LegacyItem> legacyItems = [
        LegacyItem("The Left Hand of Darkness", "book"),
        LegacyItem("A Scanner Darkly", "audiobook")
      ];

      List<Item> convertedItems =
          LegacyDataAdapter.convertLegacyItems(legacyItems);

      for (var item in convertedItems) {
        print(item.title);
        print(item.type);
      }
      break;
    default:
      print("Invalid choice.");
  }
}
