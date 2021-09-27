import 'dart:io';

import 'package:hive/hive.dart';

part 'movie_dto.g.dart';

@HiveType(typeId: 1)
class MovieDTO {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? author;
  @HiveField(1)
  final File? cover;

  MovieDTO({this.title, this.author, this.cover});
}
