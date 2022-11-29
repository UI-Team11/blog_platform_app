import 'package:blog_platform_app/models/subscription_model.dart';
import 'package:blog_platform_app/widgets/subscription_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/models/blog_model.dart';

class SubscriptionsGridView extends StatefulWidget {

  final List<SubscriptionModel> subscriptions;

  const SubscriptionsGridView({Key? key, required this.subscriptions}) : super(key: key);

  @override
  State<SubscriptionsGridView> createState() => _SubscriptionsGridViewState();
}

class _SubscriptionsGridViewState extends State<SubscriptionsGridView> {

  @override
  Widget build(BuildContext context) {
    late final List<SubscriptionModel> subscriptions = widget.subscriptions;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      controller: ScrollController(),
      itemCount: subscriptions.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: maxThumbnailSize,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SubscriptionThumbnail(subscription: subscriptions[index]);
      },
    );
  }
}



