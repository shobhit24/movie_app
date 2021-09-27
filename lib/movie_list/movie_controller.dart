import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/DTO/movie_dto.dart';

class MovieController extends GetxController {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  // late final Box box = await Hive.openBox<MovieDTO>("myBox");
  final RxList<MovieDTO> movieList = List<MovieDTO>.empty(growable: true).obs;
  final _certificate = Rxn<File>(null);

  File? get certificate => _certificate.value;

  uploadCertificate(File value) {
    _certificate.value = value;
  }


  addMovie({required MovieDTO movieData, int? index}) {
    // final box = Hive.box('myBox');
    if(index != null) {
      movieList.removeAt(index);
      movieList.insert(index, movieData);
    }
    movieList.add(movieData);
    // box.add(movieData);
    movieList.refresh();
  }

  deleteMovie(int index) {
    movieList.removeAt(index);
    movieList.refresh();
  }

  getImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      uploadCertificate(File(image.path));
    }
  }
}
