// ignore: file_names
import 'package:ecommerce_app/helper/sp_helper.dart';
import 'ui/login/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/components.dart';

class BoardingModel {
  final String image;
  final String body;
  final String title;

  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/screen1.png',
      body: 'Online Shopping',
      title: "Women Fashion Shopping Online - Shop\n "
          "from a huge range of latest women\n "
          "clothing, shoes, makeup Kits, Watches,\n "
          "footwear and more for women at best price",
    ),
    BoardingModel(
      image: 'assets/images/screen2.png',
      body: 'Add To Cart',
      title: "Add to cart button works on product pages.\n "
          "The customizations in this section\n "
          "compatible with dynamic checkout buttons\n ",
    ),
    BoardingModel(
      image: 'assets/images/screen3.png',
      body: 'Payment Successful',
      title: "Your payment has been successfully\n "
          "completed. You will receive a confirmation\n "
          "email within a few minutes\n ",
    ),
  ];

  bool isLast = false;

  void submit() {
    SpHelper.saveData(key: 'onBoarding', value: true).then((value) => {
          if (value)
            {
              NavigatorAndFinish(
                context,
                ShopLoginScreen(),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [defaultTextButton(function: submit, text: 'Skip')],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: boardController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemCount: boarding.length,
                  itemBuilder: (context, index) {
                    return buildBoardingItem(boarding[index]);
                  }),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SmoothPageIndicator(
                  controller: boardController,
                  effect: WormEffect(
                      dotHeight: 15,
                      dotWidth: 15,
                      spacing: 5,
                      dotColor: Colors.indigoAccent),
                  count: boarding.length),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      boardController.previousPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: Text("Previous", style: TextStyle(fontSize: 17)),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                        // navigatorTo(
                        //   context,
                        //   ShopLoginScreen(),
                        // );
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Text("Next", style: TextStyle(fontSize: 17)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            height: 280,
            width: 280,
            child: Image(
              image: AssetImage("${model.image}"),
              // fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${model.body}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${model.title}",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
