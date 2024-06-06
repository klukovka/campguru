import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscription_page_state.dart';

class SubscriptionPageCubit extends Cubit<SubscriptionPageState> {
  SubscriptionPageCubit() : super(const SubscriptionPageState());

  void updateExpirationDate(DateTime? expirationDate) => emit(state.copyWith(
        expirationDate: Nullable(expirationDate),
      ));
}
