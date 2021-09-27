import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/DTO/movie_dto.dart';
import 'package:movie_app/app_colors.dart';
import 'package:movie_app/custom_text_field.dart';
import 'package:movie_app/movie_list/movie_controller.dart';
import 'package:movie_app/primary_filled_button.dart';
import 'package:movie_app/strings.dart';
import 'package:movie_app/styles.dart';

class AddMovie extends GetView<MovieController> {
  final MovieDTO? movieDTO;
  final int? index;

  const AddMovie({Key? key, this.movieDTO, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: Strings.addNewMovie(),
                      style: Styles.tsWhiteSemiBold18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller:  controller.titleController ,
                hintText: "Movie Title",
              ),
              CustomTextField(
                controller: controller.authorController ,
                hintText: "Director name",
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppColors.primaryColor2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      color: AppColors.grey,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () => controller.getImage(ImageSource.gallery),
                      child: const Text(
                        "Upload Cover",
                        style: Styles.tsGreyRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Spacer(),
              PrimaryFilledButton(
                text: Strings.add(),
                onTap: () {
                  controller.addMovie(movieData: MovieDTO(
                    title: controller.titleController.text,
                    author: controller.authorController.text,
                    cover: controller.certificate,
                  ), index: movieDTO == null ? null : index!);
                  Get.back();
                },
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
