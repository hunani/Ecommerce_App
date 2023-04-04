import 'package:ecommerce/const/app_color.dart';
import 'package:ecommerce/const/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

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
                  Image.asset(AppAssets.home2Image, height: 45),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        clipBehavior: Clip.none,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              4,
                              (index) => GestureDetector(
                                    onTap: () {
                                      Get.toNamed(DetailsScreen.routeName);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 13),
                                      height: 200,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColor.kPrimaryPik,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 155,
                                            width: 140,
                                            decoration: BoxDecoration(
                                              color: AppColor.kContainer,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "\$ 97.99",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                      SizedBox(height: 30),
                      ...List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New In",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 190,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColor.kContainer,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "Pink Dress and Jacket",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(Icons.favorite_border,
                                      color: AppColor.kPrimaryPik),
                                  SizedBox(width: 15),
                                  Icon(Icons.bookmark_border,
                                      color: AppColor.kPrimaryPik),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                "\$ 146.50",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: AppColor.kPrimaryPik),
                              ),
                            ],
                          ),
                        ),
                      ),
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
