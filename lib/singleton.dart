class ConfigurationManager {
  static final ConfigurationManager _instance =
      ConfigurationManager._internal();

  factory ConfigurationManager() {
    return _instance;
  }

  ConfigurationManager._internal();

  int get maxBorrowingLimit => 5; // Example configuration value
  //double get lateFeePerDay => 0.5; // Example configuration value

  // Add other configuration getter methods
}
