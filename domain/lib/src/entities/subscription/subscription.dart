import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final int id;
  final SubscriptionType type;
  final double price;
  final double? discount;

  Subscription({
    required this.id,
    required this.type,
    required this.price,
    this.discount,
  });

  @override
  List<Object?> get props => [id, type, price, discount];
}
