import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../widget/common_text_field.dart';
import 'details4_screen.dart';

class Details3Screen extends StatefulWidget {
  static const String routeName = '/details3Screen';
  const Details3Screen({Key? key}) : super(key: key);

  @override
  State<Details3Screen> createState() => _Details3ScreenState();
}

class _Details3ScreenState extends State<Details3Screen> {
  List<String> list = [
    "Jachet",
    "Tshirt",
    "Dress",
    "Jean",
    "Blouse",
    "Sweatshirt"
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.home1Image, height: 45),
                  Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  Image.asset(AppAssets.homeDetailsImage, height: 45),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Create Tour Style",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: list
                        .asMap()
                        .map((index, value) => MapEntry(
                              index,
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      selectIndex = index;
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      height: 40,
                                      width: 100,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: selectIndex == index
                                                  ? AppColor.kPrimaryPik
                                                  : AppColor.kText),
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                      radius: 5,
                                      backgroundColor: selectIndex == index
                                          ? AppColor.kPrimaryPik
                                          : Colors.transparent),
                                ],
                              ),
                            ))
                        .values
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: selectIndex,
                  children: [
                    All(),
                    All(),
                    All(),
                    All(),
                    All(),
                    All(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Details4Screen.routeName);
                      },
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColor.kContainer,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Casual Jeans",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$50.00",
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
        ],
      ),
    );
  }
}
