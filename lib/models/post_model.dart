import 'package:date_app/models/user_model.dart';

enum TypeFavorite {
  football,
  nature,
  language,
  photography,
  music,
  writing,
}

class PostModel {
  final UserModel user;
  final TypeFavorite type;
  final String content;
  final String image;
  final int like;
  final int comment;
  final int share;

  PostModel({
    required this.user,
    required this.type,
    required this.content,
    required this.image,
    required this.like,
    required this.comment,
    required this.share,
  });
}
