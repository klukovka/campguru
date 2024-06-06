import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscription_page_state.dart';

class SubscriptionPageCubit extends Cubit<SubscriptionPageState> {
  SubscriptionPageCubit() : super(const SubscriptionPageState());

  void updateUser(User? user) => emit(state.copyWith(
        user: Nullable(user),
      ));

  void setSubscriptions(List<Subscription> subscriptions) =>
      emit(state.copyWith(subscriptions: subscriptions));

  void startLoading() => emit(state.copyWith(isLoading: true));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
