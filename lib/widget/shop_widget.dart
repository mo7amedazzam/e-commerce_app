import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/search/search-screen.dart';
import '../shop/cubit/states.dart';
import 'package:ecommerce_app/ui/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopWidget extends StatelessWidget {
  static final routeName = 'shop widget';
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Container(
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Color(0xFFffffff),
                // appBar: AppBar(
                //   flexibleSpace: Container(
                //     decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //       //663399  //8A2BE2  //9932CC  //9400D3
                //       colors: [Color(0xFF4B0082), Color(0xFF9966cc)],
                //       stops: [0.3, 1.0],
                //     )),
                //   ),
                //   elevation: 0.0,
                //   backgroundColor: Colors.deepPurpleAccent,
                //   leading: Padding(
                //       padding: const EdgeInsets.only(right: 15, bottom: 10),
                //       child: IconButton(
                //         icon: Icon(Icons.menu, color: Colors.white),
                //         onPressed: () {
                //           navigatorTo2(context, SearchScreen());
                //         },
                //       )),
                //   title: Align(
                //     alignment: Alignment.topCenter,
                //     child: Padding(
                //       padding: const EdgeInsets.only(bottom: 18),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(
                //             "My",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 19,
                //               color: Colors.amber,
                //             ),
                //           ),
                //           Text(
                //             "Shop",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 19,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                //   actions: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 5, bottom: 10),
                //       child: Icon(
                //         Icons.notification_important_outlined,
                //         color: Colors.white,
                //       ),
                //     )
                //   ],
                // ),
                body: cubit.bottomScreen[cubit.currentIndex],
                bottomNavigationBar:
                Stack(
                  children: [
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(right: 70, top: 10),
                      child: BottomNavigationBar(
                          backgroundColor: Colors.white,
                          selectedItemColor: Color(0xFF8040bf),
                          onTap: (index) {
                            cubit.changeBottom(index);
                          },
                          currentIndex: cubit.currentIndex,
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.home,
                                ),
                                label: 'Home'),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.grid_view,
                                ),
                                label: 'Categories'),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.favorite,
                                ),
                                label: 'Favorite'),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.person,
                                ),
                                label: 'Profile'),
                          ]),
                    ),
                    Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              left: 280,
                            ),
                            height: 55,
                            width: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                //663399  //8A2BE2  //9932CC  //9400D3
                                colors: [Color(0xFF6800b3), Color(0xFFbf66ff)],
                                stops: [0.3, 1.0],
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Align(
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: RichText(textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                    children: [
                                      WidgetSpan(
                                        child: Align(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.only(top: 5,),
                                              child:
                                              Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 25,),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(text: '\$254.36'),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   child: Icon(
                            //     Icons.shopping_cart_outlined,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}

Widget stack() {
  return Container(
    alignment: Alignment.bottomLeft,
    height: 50,
    width: 60,
    color: Colors.amber,
  );
}
/*
Scaffold(
          backgroundColor: Color(0xFFcccccc),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex ,
              items: [
            BottomNavigationBarItem(

                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_view,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.perm_identity,
                ),
                label: 'Profile'),
          ]),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 17,left: 17),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child:IconButton( icon: Icon(Icons.search_rounded) , onPressed: (){
                        navigatorTo(context, SrearchScreen());
                        })),
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.deepPurpleAccent,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Icon(Icons.menu),
                  ),
                  title: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "MyShop",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.notification_important),
                    )
                  ],
                ),
                AppBar(
                  backgroundColor: Colors.deepPurpleAccent,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Icon(Icons.menu),
                  ),
                  title: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "MyShop",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.notification_important),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
 */
/////////////////////////////////////////////////////////////////////////
/*
new Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 17,left: 17),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.search_rounded)),
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              )
            ],
          ),
 */
