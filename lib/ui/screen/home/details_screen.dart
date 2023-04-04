import 'package:ecommerce/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_icon.dart';
import '../../../widget/common_text_field.dart';
import 'details3_screen.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = '/detailsScreen';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<CategoriesModel> list = [
    CategoriesModel(icon: AppAssets.categories1Image, label: "Jacket"),
    CategoriesModel(icon: AppAssets.categories2Image, label: "Tshirt"),
    CategoriesModel(icon: AppAssets.categories3Image, label: "Dress"),
    CategoriesModel(icon: AppAssets.categories4Image, label: "Jean"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      color: AppColor.kContainer,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  Image.asset(AppAssets.home2Image, height: 45),
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(
                validator: (val) =>
                    val!.trim().isEmpty ? "field required" : null,
                textFieldType: TextFieldType.search,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColor.kPrimaryPik),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: list
                            .map((e) => Column(
                                  children: [
                                    Image.asset(e.icon, height: 40),
                                    SizedBox(height: 8),
                                    Text(e.label,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: AppColor.kText)),
                                  ],
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            "Popular Fashion",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColor.kPrimaryPik),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      AlignedGridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Details3Screen.routeName);
                                      },
                                      child: Container(
                                        height: 120,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: AppColor.kContainer,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: -10,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: AppColor.kPrimaryPik,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Icon(Icons.favorite,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Khaki Woman Coat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\$52.95",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: AppColor.kText),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "\$35.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: AppColor.kPrimaryPik),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesModel {
  final String label;
  final String icon;

  const CategoriesModel({required this.icon, required this.label});
}
