import 'package:blog_platform_app/bloc/subscriptions_cubit.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/models/subscription_model.dart';
import 'package:blog_platform_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionButton extends StatefulWidget {
  final UserModel publisher;
  final UserModel user;

  const SubscriptionButton(
      {Key? key, required this.publisher, required this.user})
      : super(key: key);

  @override
  State<SubscriptionButton> createState() => _SubscriptionButtonState();
}

class _SubscriptionButtonState extends State<SubscriptionButton> {
  @override
  Widget build(BuildContext context) {
    UserModel publisher = widget.publisher;
    UserModel user = widget.user;

    return BlocBuilder<SubscriptionsCubit, SubscriptionsState>(
        builder: (context, currState) {
          SubscriptionModel? subscription;
          bool isSubscribed = false;

          try {
            subscription = currState.subscriptions.firstWhere(
                  (element) {
                return element.publisherID == publisher.id &&
                    element.userID == user.id;
              },
            );
            isSubscribed = true;
          } catch (error) {
            isSubscribed = false;
            subscription = null;
          }

          return Container(
            height: kToolbarHeight / 1.3,
            child: ElevatedButton(
              onPressed: () {
                //TODO: Susbcribe
                if (currState
                is SubscriptionsLoadingState) {
                  return;
                }

                if (isSubscribed) {
                  context
                      .read<SubscriptionsCubit>()
                      .deleteSubscription(subscription!
                      .subscriptionID!);
                } else {
                  context
                      .read<SubscriptionsCubit>()
                      .addSubscription(
                      SubscriptionModel(
                        publisherID: publisher.id,
                        userID: user.id,
                        publisherName: publisher.username,
                        userName: user.username,
                      ));
                }
              },
              child: Center(
                child: (currState
                is SubscriptionsLoadingState)
                    ? Text("Loading...")
                    : (isSubscribed)
                    ? Text("Unsubscribe")
                    : Text("Subscribe"),
              ),
              style: ElevatedButton.styleFrom(
                // backgroundColor: Color(primaryColorDark),
                //primary: blueNavy[300],
                //fixedSize: const Size(200, 200),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30)),
              ),
            ),
          );
        });
  }
}
