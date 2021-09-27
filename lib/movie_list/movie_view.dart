import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/add_movie.dart';
import 'package:movie_app/app_colors.dart';
import 'package:movie_app/movie_list/movie_container.dart';
import 'package:movie_app/movie_list/movie_controller.dart';
import 'package:movie_app/strings.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Movie Demo Page'),
      ),
      body: Obx(
        () => controller.movieList.value.isEmpty
            ? const Center(
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 100,
                  color: AppColors.primaryColor,
                ),
              )
            : GridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 14,
                children: List.generate(
                  controller.movieList.value.length,
                  (index) => MovieContainer(
                    index: index,
                    movieDTO: controller.movieList.value[index],
                  ),
                ),
              ),
        // ValueListenableBuilder(
        //         valueListenable: controller.box.listenable(),
        //         builder: (BuildContext context, Box movies, _) {
        //           List<int> myKeys = movies.keys.cast<int>().toList();
        //           return GridView.count(
        //             padding: const EdgeInsets.symmetric(
        //               horizontal: 16,
        //               vertical: 20,
        //             ),
        //             crossAxisCount: 2,
        //             crossAxisSpacing: 20,
        //             mainAxisSpacing: 14,
        //             children: List.generate(
        //               myKeys.length,
        //               (index) => MovieContainer(
        //                 index: index,
        //                 movieDTO: movies.get(myKeys[index]),
        //               ),
        //             ),
        //           );
        //         },
        //       ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => Get.to(const AddMovie()),
        tooltip: Strings.addNewMovie(),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
