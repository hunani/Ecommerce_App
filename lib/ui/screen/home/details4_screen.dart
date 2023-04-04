import 'package:ecommerce/ui/screen/home/details5_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class Details4Screen extends StatefulWidget {
  static const String routeName = '/details4Screen';
  const Details4Screen({Key? key}) : super(key: key);

  @override
  State<Details4Screen> createState() => _Details4ScreenState();
}

class _Details4ScreenState extends State<Details4Screen> {
  List<String> list = ["All", "Women", "Men"];
  int selectIndex = 0;
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
                  Image.asset(AppAssets.home1Image, height: 45),
                  Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  Image.asset(AppAssets.homeDetailsImage, height: 45),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: list
                      .asMap()
                      .map((index, value) => MapEntry(
                            index,
                            GestureDetector(
                              onTap: () {
                                selectIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: 40,
                                width: 80,
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
                          ))
                      .values
                      .toList(),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: selectIndex,
                  children: [
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Row(
              children: List.generate(
                  4,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Details5Screen.routeName);
                              },
                              child: Container(
                                height: 230,
                                width: 220,
                                decoration: BoxDecoration(
                                  color: AppColor.kContainer,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: Icon(Icons.favorite_border,
                                              color: AppColor.kPrimaryPik),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Image.asset(AppAssets.containerImage,
                                            height: 48),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Classic White Blouse",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "\$ 84.50",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: AppColor.kPrimaryPik),
                            ),
                          ],
                        ),
                      )),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Popular",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          ...List.generate(
            4,
            (index) => Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 3, right: 3),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 4),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColor.kContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Floral Print Skirt",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Massa quis maximus",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: AppColor.kText),
                            ),
                            Text(
                              "\$ 35.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: AppColor.kPrimaryPik),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 15,
                  child: Image.asset(AppAssets.containerImage, height: 48),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
