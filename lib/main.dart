import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movie_list/movie_controller.dart';
import 'package:movie_app/movie_list/movie_view.dart';
import 'package:path_provider/path_provider.dart';
import 'DTO/movie_dto.dart';

void main() async {
  Get.put(MovieController());

  try {
    Directory? appDocDir = await getExternalStorageDirectory();
    debugPrint("path ${appDocDir!.path}");
  } catch (e) {
    debugPrint("path ");
  }
  // Hive.init(appDocDir.path);
  Hive.registerAdapter(MovieDTOAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieView(),
    );
  }
}
