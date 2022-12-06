part of 'likes_cubit.dart';

abstract class LikesState extends Equatable {
  final List<LikeModel> likes;

  const LikesState ({required this.likes});

  @override
  List<Object> get props => [likes];
}

class LikesInitialState extends LikesState {
  const LikesInitialState ({required List<LikeModel> likes})
      : super(likes: likes);
}

class LikesLoadingState extends LikesState  {
  const LikesLoadingState ({required List<LikeModel> likes})
      : super(likes: likes);
}

class LikesLoadedState extends LikesState {
  const LikesLoadedState ({required List<LikeModel> likes})
      : super(likes: likes);
}

class LikesErrorState extends LikesState {
  final String? message;

  const LikesErrorState ({required this.message, required List<LikeModel> likes})
      : super(likes: likes);
}
