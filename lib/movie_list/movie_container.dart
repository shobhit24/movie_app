import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/DTO/movie_dto.dart';
import 'package:movie_app/add_movie.dart';
import 'package:movie_app/app_colors.dart';
import 'package:movie_app/movie_list/movie_controller.dart';
import 'package:movie_app/strings.dart';
import 'package:movie_app/styles.dart';

class MovieContainer extends GetView<MovieController> {
  final MovieDTO movieDTO;
  final int index;

  const MovieContainer({Key? key, required this.movieDTO, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 171,
          width: 173,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.file(
                      movieDTO.cover!,
                      width: Get.width,
                      height: 256,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: movieDTO.title.toString(),
                            style: Styles.tsWhiteSemiBold16,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: Strings.byAuthor(
                                author: movieDTO.author!.toString()),
                            style: Styles.tsWhiteSemiBold12,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Get.to(
                        AddMovie(
                          index: index,
                          movieDTO: movieDTO,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 22.0,
          top: 8.0,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blackOpacity10,
            ),
            child: InkWell(
              onTap: () => controller.deleteMovie(index),
              child: const Icon(
                Icons.close,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
