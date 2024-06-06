import 'package:domain/src/entities/subscription/subscription_type.dart';
import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String phone;
  final String card;
  final String cardExpMonth;
  final String cardExpYear;
  final String cardCvv;
  final String cardHolderName;
  final SubscriptionType subscriptionType;
  final double cashAmount;

  Payment({
    required this.phone,
    required this.card,
    required this.cardExpMonth,
    required this.cardExpYear,
    required this.cardCvv,
    required this.cardHolderName,
    required this.subscriptionType,
    required this.cashAmount,
  });

  @override
  List<Object> get props {
    return [
      phone,
      card,
      cardExpMonth,
      cardExpYear,
      cardCvv,
      cardHolderName,
      cashAmount,
      subscriptionType,
    ];
  }
}
