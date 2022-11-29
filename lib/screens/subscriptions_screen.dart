import 'package:blog_platform_app/bloc/subscriptions_cubit.dart';
import 'package:blog_platform_app/models/subscription_model.dart';
import 'package:blog_platform_app/widgets/bottom_loader_indicator.dart';
import 'package:blog_platform_app/widgets/subscriptions_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<SubscriptionsCubit, SubscriptionsState>(
          builder: (context, currState) {
        List<SubscriptionModel> filteredSubscriptions = [];

        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          return Center(child: Text("Error: User not found"));
        }

        if (currState is SubscriptionsErrorState) {
          return Center(child: Text("${currState.message}"));
        }

        if (currState is SubscriptionsLoadingState) {
          return LoaderIndicator();
        }

        for (SubscriptionModel subscription in currState.subscriptions) {
          if (subscription.userID == user.uid) {
            filteredSubscriptions.add(subscription);
          }
        }

        if (filteredSubscriptions.isEmpty) {
          return const Center(child: Text("You are not subscribed to any publisher"));
        }

        return SubscriptionsGridView(subscriptions: filteredSubscriptions);
      });
    });
  }
}
