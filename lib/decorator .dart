abstract class Fine {
  double calculateFine(int overdueDays);
}

class BaseFine implements Fine {
  @override
  double calculateFine(int overdueDays) {
    return overdueDays * 0.5; // Example base fine calculation
  }
}

class ReplacementCostDecorator extends Fine {
  final Fine decoratedFine;

  ReplacementCostDecorator(this.decoratedFine);

  @override
  double calculateFine(int overdueDays) {
    double baseFine = decoratedFine.calculateFine(overdueDays);
    return baseFine > 10.0 ? baseFine : 10.0; // Minimum replacement cost
  }
}
