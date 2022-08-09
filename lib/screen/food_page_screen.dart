// import 'dart:ffi';
// import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/wigits/icon_and_text.dart';
import 'package:flutter_application_1/wigits/small_text.dart';

import '../wigits/big_text.dart';

class FoodPageScreen extends StatefulWidget {
  const FoodPageScreen({Key? key}) : super(key: key);

  @override
  State<FoodPageScreen> createState() => _FoodPageScreenState();
}

class _FoodPageScreenState extends State<FoodPageScreen> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print("Current Page value: " + _currentPageValue.toString());
      });
    });
  }

  @override
  // ignore: must_call_super
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          // padding: EdgeInsets.only(bottom: 20),
          height: 270,
          // color: Colors.red,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // ignore: unnecessary_new
        new DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              BigText(text: "Popular"),
              const SizedBox(
                width: 10,
              ),
              SmallText(
                text: "Preparing",
                size: 10,
              ),
            ],
          ),
        ),

        //popular list view
        Container(
          height: 900,
          padding: EdgeInsets.only(right: 13.0),
          // color: Colors.blue,
          child: Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage("assets/images/food1.jpg"))),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            // color: Colors.pink,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(text: "Sweet Desert"),
                                  SmallText(text: "Testing all the foods"),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        IconAndText(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: Colors.green),
                                        IconAndText(
                                            icon: Icons.location_on,
                                            text: "1.7Km",
                                            iconColor: Colors.red),
                                        IconAndText(
                                            icon: Icons.timelapse_rounded,
                                            text: "32min",
                                            iconColor: Colors.green),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  );
                }
                // itemBuilder: (BuildContext context, int index) {
                //   return ListTile(
                //       leading: const Icon(Icons.list),
                //       trailing: const Text(
                //         "GFG",
                //         style: TextStyle(color: Colors.green, fontSize: 15),
                //       ),
                //       title: Text("List item $index"));
                // },
                ),
          ),
          // child: ListView.builder(
          //     // scrollDirection: Axis.vertical,
          //     physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: 10,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         child: Row(
          //           children: [
          //             Container(
          //               height: 120,
          //               width: 120,
          //               color: Colors.amber,
          //             )
          //           ],
          //         ),
          //       );
          //     }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xFF42A5F5)
                    : const Color(0xFF42A688),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food1.jpg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF42A688),
                    offset: Offset(0, 1),
                    blurRadius: 5.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                    // blurRadius: 5.0,
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chines Side"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Color(0xFF42A688),
                              size: 15,
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        SmallText(text: "4.8"),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1287 Comments"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        IconAndText(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: Colors.green),
                        IconAndText(
                            icon: Icons.location_on,
                            text: "1.7Km",
                            iconColor: Colors.red),
                        IconAndText(
                            icon: Icons.timelapse_rounded,
                            text: "32min",
                            iconColor: Colors.green),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
