import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blog_platform_app/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitialState());
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(const AuthLoadingState());

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user?.updateDisplayName(username);

      String id = credential.user!.uid;

      UserModel user = UserModel(
        id: id,
        email: email,
        username: username,
        accountType: AccountType.free,
        isAdmin: false,
      );

      usersCollection.doc(id).set({
        "email": user.email,
        "username": user.username,
        "accountType": user.accountType.name,
        "isAdmin": user.isAdmin,
      });

      emit(AuthSignedInState(user: user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const AuthErrorState(
          "The password provided is too weak.",
        ));
      } else if (e.code == 'email-already-in-use') {
        emit(const AuthErrorState(
          "The account already exists for that email.",
        ));
      } else if (e.code == 'invalid-email') {
        emit(const AuthErrorState(
          "The email address is not valid",
        ));
      } else {
        emit(const AuthErrorState(
          "An error has occurred while signing up",
        ));
      }
    } catch (e) {
      emit(const AuthErrorState());
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoadingState());

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User authUser = credential.user!;
      usersCollection
          .doc(authUser.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {

          Map<String, dynamic>? userData =
              documentSnapshot.data() as Map<String, dynamic>?;

          AccountType status;
          if(userData!['accountType'] == 'premium'){
            status = AccountType.premium;
          } else {
            status = AccountType.free;
          }

          UserModel user = UserModel(
            id: authUser.uid,
            username: userData!['username'],
            email: userData!['email'],
            isAdmin: userData!['isAdmin'],
            accountType: status,
          );
          emit(AuthSignedInState(user: user));
        } else {
          emit(const AuthErrorState(
            "Error getting user data.",
          ));
        }
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const AuthErrorState(
          "No user found for that email.",
        ));
      } else if (e.code == 'wrong-password') {
        emit(const AuthErrorState(
          "Wrong password provided for that email.",
        ));
      } else if (e.code == 'user-disabled') {
        emit(const AuthErrorState(
          "Account was temporarily disabled due to many failed login attempts",
        ));
      } else if (e.code == 'invalid-email') {
        emit(const AuthErrorState(
          "The email address is not valid",
        ));
      } else {
        emit(const AuthErrorState(
          "An error has occurred while signing in",
        ));
      }
    } catch (e) {
      emit(const AuthErrorState(
        "An error has occurred while signing in",
      ));
    }
  }

  Future<void> signOut() async {
    emit(const AuthLoadingState());

    await FirebaseAuth.instance.signOut();

    emit(const AuthInitialState());
  }

  Future<void> signOutListener() async {
    emit(const AuthInitialState());
  }

  Future<void> signInListener({required User authUser}) async {
    usersCollection
        .doc(authUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {

        Map<String, dynamic>? userData =
        documentSnapshot.data() as Map<String, dynamic>?;

        AccountType status;
        if(userData!['accountType'] == 'premium'){
          status = AccountType.premium;
        } else {
          status = AccountType.free;
        }

        UserModel user = UserModel(
          id: authUser.uid,
          username: userData!['username'],
          email: userData!['email'],
          isAdmin: userData!['isAdmin'],
          accountType: status,
        );
        emit(AuthSignedInState(user: user));
      } else {
        emit(const AuthErrorState(
          "Error getting user data.",
        ));
      }
    });
  }

  Future<void> resetAuthState() async {
    emit(const AuthInitialState());
  }
}
