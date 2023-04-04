import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class Details5Screen extends StatefulWidget {
  static const String routeName = '/details5Screen';
  const Details5Screen({Key? key}) : super(key: key);

  @override
  State<Details5Screen> createState() => _Details5ScreenState();
}

class _Details5ScreenState extends State<Details5Screen> {
  List<Model> list = [
    Model(image: AppAssets.allImage, text: "All"),
    Model(image: AppAssets.womanImage, text: "Women"),
    Model(image: AppAssets.manImage, text: "Men"),
  ];
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
              SizedBox(height: 30),
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
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 4)
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(value.image,
                                        height: 20,
                                        color: selectIndex == index
                                            ? AppColor.kPrimaryPik
                                            : AppColor.kText),
                                    SizedBox(width: 10),
                                    Text(
                                      value.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: selectIndex == index
                                              ? AppColor.kPrimaryPik
                                              : AppColor.kText),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .values
                      .toList(),
                ),
              ),
              SizedBox(height: 15),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          children: [
            SizedBox(height: 20),
            AlignedGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 4),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Spacer(),
                                  Icon(Icons.favorite_border,
                                      color: AppColor.kPrimaryPik),
                                ],
                              ),
                              SizedBox(height: 30),
                              Container(
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColor.kContainer,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Turquoise Shirt",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "\$84.50",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: AppColor.kPrimaryPik),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Color(0xffFDD446),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "(4.8)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child:
                            Image.asset(AppAssets.container2Image, height: 48),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Model {
  final String image;
  final String text;

  const Model({required this.image, required this.text});
}
