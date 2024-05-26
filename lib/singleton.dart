class ConfigurationManager {
  static final ConfigurationManager _instance =
      ConfigurationManager._internal();

  factory ConfigurationManager() {
    return _instance;
  }

  ConfigurationManager._internal();

  // Library-wide settings
  final int maxBorrowingLimit = 5;
  final double lateFeePerDay = 0.5;
  final int renewalPeriod = 7; // Days

  // Getter methods for configuration values
  int get getMaxBorrowingLimit => maxBorrowingLimit;
  double get getLateFeePerDay => lateFeePerDay;
  int get getRenewalPeriod => renewalPeriod;
}
