class SubscriptionModel {
  String? subscriptionID;
  String publisherID, userID, publisherName, userName;

  SubscriptionModel({
    this.subscriptionID,
    required this.publisherID,
    required this.userID,
    required this.publisherName,
    required this.userName,
  });
}
