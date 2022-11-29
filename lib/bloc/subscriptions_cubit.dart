import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:blog_platform_app/models/subscription_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'subscriptions_state.dart';

class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  SubscriptionsCubit()
      : super(const SubscriptionsLoadingState(subscriptions: []));

  CollectionReference subscriptionsCollection =
      FirebaseFirestore.instance.collection('subscriptions');

  Future<void> loadSubscriptions() async {
    List<SubscriptionModel> subscriptions = [];
    User? user = FirebaseAuth.instance.currentUser;

    print("Loading...");
    if (user == null) {
      emit(const SubscriptionsErrorState(
        message: "Please sign in to access this feature",
        subscriptions: [],
      ));
    }

    emit(const SubscriptionsLoadingState(subscriptions: []));
    subscriptionsCollection
        .where('userID', isEqualTo: user!.uid)
        .get()
        .then((snapShot) {
      List<QueryDocumentSnapshot> docs = snapShot.docs;
      if (docs.isEmpty) {
        print("Docs Empty!!");
        emit(const SubscriptionsErrorState(
            message: "You are not subscribed to any publisher",
            subscriptions: []));
        return;
      }
      for (QueryDocumentSnapshot doc in docs) {
        subscriptions.add(
          SubscriptionModel(
            subscriptionID: doc.id,
            userID: doc['userID'],
            publisherID: doc['publisherID'],
            userName: doc['userName'],
            publisherName: doc['publisherName'],
          ),
        );
      }
      print("Printing Subscriptions");
      print(subscriptions);
      emit(SubscriptionsLoadedState(subscriptions: subscriptions));
    }).catchError((error) {
      print(error.toString());
      emit(SubscriptionsErrorState(
          message: "Error loading the subscriptions",
          subscriptions: subscriptions));
    });
  }

  Future<void> addSubscription(SubscriptionModel subscription) async {
    List<SubscriptionModel> subscriptions = [...state.subscriptions];
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(const SubscriptionsErrorState(
        message: "Please sign in to access this feature",
        subscriptions: [],
      ));
    }

    emit(SubscriptionsLoadingState(subscriptions: subscriptions));

    print(subscriptions);

    subscriptionsCollection.add({
      'userID': subscription.userID,
      'publisherID': subscription.publisherID,
      'userName': subscription.userName,
      'publisherName': subscription.publisherName,
    }).then((value) {
      print("Document ID: ${value.id}");
      subscription.subscriptionID = value.id;
      subscriptions.add(subscription);
      print(subscriptions);
      emit(SubscriptionsLoadedState(subscriptions: subscriptions));
      print("Loaded!");
    }).catchError((error) {
      print(error);
      emit(SubscriptionsErrorState(
          message: "Error saving the subscriptions",
          subscriptions: subscriptions));
    });
  }

  Future<void> deleteSubscription(
    String subscriptionID,
  ) async {
    List<SubscriptionModel> subscriptions = [...state.subscriptions];
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(const SubscriptionsErrorState(
        message: "Please sign in to access this feature",
        subscriptions: [],
      ));
    }

    emit(SubscriptionsLoadingState(subscriptions: subscriptions));

    print(subscriptionID);

    subscriptionsCollection.doc(subscriptionID).delete().then((value) {
      print("Trying deletion");
      subscriptions.removeWhere((subscription) {
        return subscription.subscriptionID == subscriptionID;
      });
      print("Subscription Deleted: $subscriptionID");
      emit(SubscriptionsLoadedState(subscriptions: subscriptions));
    }).catchError((error) {
      print(error);
      emit(SubscriptionsErrorState(
          message: "Error deleting the subscriptions",
          subscriptions: subscriptions));
    });
  }
}
