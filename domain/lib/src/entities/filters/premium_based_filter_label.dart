import 'package:domain/domain.dart';

class PremiumBasedFilterLabel {
  final int id;
  final FilterLabel name;
  final bool isPremium;

  PremiumBasedFilterLabel({
    required this.id,
    required this.name,
    required this.isPremium,
  });
}
