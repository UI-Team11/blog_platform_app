import 'package:blog_platform_app/models/blog_model.dart';
import 'package:blog_platform_app/models/subscription_model.dart';
import 'package:blog_platform_app/screens/blog_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:blog_platform_app/services/time_service.dart';
import '../custom_theme.dart';

const double maxThumbnailSize = 250;

class SubscriptionThumbnail extends StatelessWidget {
  final SubscriptionModel subscription;

  const SubscriptionThumbnail({Key? key, required this.subscription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeHelper _timeHelper = TimeHelper();

    return SizedBox(
      width: maxThumbnailSize,
      height: maxThumbnailSize,
      child: Column(
        children: [
          Expanded(
            //TODO: Add images in storage
            child: ElevatedButton(
              child: Container(
              ),
              onPressed: (){
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Publisher: ${subscription.publisherName}"),
              const Expanded(child: SizedBox()),
              Text("User: ${subscription.userName}"),
            ],
          ),

        ],
      ),
    );
  }
}
