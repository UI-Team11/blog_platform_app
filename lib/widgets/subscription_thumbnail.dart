import 'package:blog_platform_app/bloc/subscriptions_cubit.dart';
import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/models/subscription_model.dart';
import 'package:blog_platform_app/screens/blog_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/services/time_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_theme.dart';

const double maxThumbnailSize = 200;

class SubscriptionThumbnail extends StatelessWidget {
  final SubscriptionModel subscription;

  const SubscriptionThumbnail({Key? key, required this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeHelper _timeHelper = TimeHelper();

    return SizedBox(
      width: maxThumbnailSize,
      height: maxThumbnailSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            //TODO: Add images in storage
            child: ElevatedButton(
              child: Center(
                child: Text(subscription.publisherName),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(secondaryColorDark),
                //primary: blueNavy[300],
                //fixedSize: const Size(200, 200),
                shape: const CircleBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          // IconButton(
          //   onPressed: () {
          //     context
          //         .read<SubscriptionsCubit>()
          //         .deleteSubscription(subscription.subscriptionID!);
          //   },
          //   icon: Icon(Icons.clear_outlined),
          // )
          ElevatedButton(
            onPressed: () {
              context
                  .read<SubscriptionsCubit>()
                  .deleteSubscription(subscription.subscriptionID!);
            },
            child: const Text("Unsubscribe"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
