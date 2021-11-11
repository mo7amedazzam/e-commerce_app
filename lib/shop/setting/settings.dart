import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'package:ecommerce_app/shop/setting/terms.dart';
import 'package:ecommerce_app/shop/setting/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import 'about_us.dart';

class SettingsScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        if (model != null) {
          nameController.text = model.data.name;
          emailController.text = model.data.email;
          phoneController.text = model.data.phone;
        }

        var formKey = GlobalKey<FormState>();
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    //663399  //8A2BE2  //9932CC  //9400D3
                    colors: [Color(0xFF4B0082), Color(0xFF9966cc)],
                    stops: [0.3, 1.0],
                  )),
            ),
            backgroundColor: Colors.deepPurpleAccent,
            title: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // leading: Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: IconButton(
            //     icon:Icon(Icons.arrow_back_ios,color: Colors.white,
            //       size: 30,),
            //     onPressed: (){
            //       NavigatorAndFinishToHome(context, HomePage());
            //     },
            //   ),
            // ),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) => model != null,
            widgetBuilder: (context) => Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 80),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage('assets/images/user_image.png')),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 // Text(model.data.name),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    model.data.email,
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15),
                                  ),
                                  textButton(
                                      text:
                                          'Click Here To Show Your Data And Update It ',
                                      fun: () {
                                        navigateTo(
                                            widget: UserScreen(),
                                            context: context);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    defaultButton(
                      function: () {
                        signOut(context);
                      },
                      text: "Logout",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textButton(
                            text: 'About US ',
                            fun: () {
                              navigateTo(widget: AboutUs(), context: context);
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        textButton(
                            text: 'Our Terms ',
                            fun: () {
                              navigateTo(widget: Terms(), context: context);
                            }),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            fallbackBuilder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
