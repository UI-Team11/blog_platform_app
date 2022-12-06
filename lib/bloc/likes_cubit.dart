import 'package:bloc/bloc.dart';
import 'package:blog_platform_app/models/like_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'likes_state.dart';

class LikesCubit extends Cubit<LikesState> {
  LikesCubit()
      : super(const LikesLoadingState(likes: []));

  CollectionReference likesCollection =
  FirebaseFirestore.instance.collection('subscriptions');

  Future<void> loadLikes() async {
    List<LikeModel> likes = [];
    User? user = FirebaseAuth.instance.currentUser;

    print("Loading...");
    if (user == null) {
      emit(const LikesErrorState(
        message: "Please sign in to access this feature",
        likes: [],
      ));
    }

    emit(const LikesLoadingState(likes: []));
    likesCollection
        .where('userID', isEqualTo: user!.uid)
        .get()
        .then((snapShot) {
      List<QueryDocumentSnapshot> docs = snapShot.docs;
      if (docs.isEmpty) {
        print("Docs Empty!!");
        emit(const LikesErrorState(
            message: "You are not subscribed to any publisher",
            likes: []));
        return;
      }
      for (QueryDocumentSnapshot doc in docs) {
        likes.add(
          LikeModel(
            likeID: doc.id,
            userID: doc['userID'],
            blogID: doc['blogID'],
            userName: doc['userName'],
          ),
        );
      }
      print("Printing Subscriptions");
      print(likes);
      emit(LikesLoadedState(likes: likes));
    }).catchError((error) {
      print(error.toString());
      emit(LikesErrorState(
          message: "Error loading the subscriptions",
          likes: likes));
    });
  }

  Future<void> addLike(LikeModel like) async {
    List<LikeModel> likes = [...state.likes];
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(const LikesErrorState(
        message: "Please sign in to access this feature",
        likes: [],
      ));
    }

    emit(LikesLoadingState(likes: likes));

    print(likes);

    likesCollection.add({
      'userID': like.userID,
      'blogID': like.blogID,
      'userName': like.userName,
    }).then((value) {
      print("Document ID: ${value.id}");
      like.likeID = value.id;
      likes.add(like);
      print(likes);
      emit(LikesLoadedState(likes: likes));
      print("Loaded!");
    }).catchError((error) {
      print(error);
      emit(LikesErrorState(
          message: "Error saving the likes",
          likes: likes));
    });
  }

  Future<void> deleteLike(
      String likeID,
      ) async {
    List<LikeModel> likes = [...state.likes];
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(const LikesErrorState(
        message: "Please sign in to access this feature",
        likes: [],
      ));
    }

    emit(LikesLoadingState(likes: likes));

    print(likeID);

    likesCollection.doc(likeID).delete().then((value) {
      print("Trying deletion");
      likes.removeWhere((like) {
        return like.likeID == likeID;
      });
      print("Like Deleted: $likeID");
      emit(LikesLoadedState(likes: likes));
    }).catchError((error) {
      print(error);
      emit(LikesErrorState(
          message: "Error deleting the likes",
          likes: likes));
    });
  }
}
