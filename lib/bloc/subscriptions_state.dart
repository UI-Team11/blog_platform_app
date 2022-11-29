part of 'subscriptions_cubit.dart';

abstract class SubscriptionsState extends Equatable {
  final List<SubscriptionModel> subscriptions;

  const SubscriptionsState ({required this.subscriptions});

  @override
  List<Object> get props => [subscriptions];
}

class SubscriptionsInitialState extends SubscriptionsState {
  const SubscriptionsInitialState ({required List<SubscriptionModel> subscriptions})
      : super(subscriptions: subscriptions);
}

class SubscriptionsLoadingState extends SubscriptionsState  {
  const SubscriptionsLoadingState({required List<SubscriptionModel> subscriptions})
      : super(subscriptions: subscriptions);
}

class SubscriptionsLoadedState extends SubscriptionsState {
  const SubscriptionsLoadedState({required List<SubscriptionModel> subscriptions})
      : super(subscriptions: subscriptions);
}

class SubscriptionsErrorState extends SubscriptionsState {
  final String? message;

  const SubscriptionsErrorState({required this.message, required List<SubscriptionModel> subscriptions})
    : super(subscriptions: subscriptions);
}
