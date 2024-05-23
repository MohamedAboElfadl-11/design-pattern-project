import 'abstract_factory.dart';

class LegacyItem {
  final String title;
  final String format; // Could be "book", "audiobook", etc.

  LegacyItem(this.title, this.format);
}

class ItemAdapter implements Item {
  final LegacyItem _legacyItem;

  ItemAdapter(this._legacyItem);

  @override
  String get title => _legacyItem.title;

  @override
  String get type {
    switch (_legacyItem.format) {
      case "book":
        return "Book";
      case "audiobook":
        return "Audiobook";
      default:
        return "Unknown";
    }
  }
}

class LegacyDataAdapter {
  static List<Item> convertLegacyItems(List<LegacyItem> legacyItems) {
    return legacyItems.map((item) => ItemAdapter(item)).toList();
  }
}
