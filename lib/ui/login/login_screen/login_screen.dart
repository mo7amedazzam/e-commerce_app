import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/constans/const.dart';
import 'package:ecommerce_app/helper/sp_helper.dart';
import 'package:ecommerce_app/ui/login/cubit/cubit.dart';
import 'package:ecommerce_app/ui/login/states.dart';
import 'package:ecommerce_app/ui/register/register_screen.dart';
import 'package:ecommerce_app/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);

              SpHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                token = state.loginModel.data.token;

                Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                NavigatorAndFinish(
                  context,
                  ShopWidget(),
                );
              });
            } else {
              print(state.loginModel.message);

              Fluttertoast.showToast(
                msg: state.loginModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Color(0xFFfffff4),
            // appBar: AppBar(
            //   backgroundColor: Color(0xFFfffff4),
              // actions: [
              //   defaultTextButton(
              //     function: () {
              //       NavigatorAndFinish(
              //         context,
              //         ShopLoginScreen(),
              //       );
              //     },
              //     text: 'Skip',
              //   ),
              // ],
            //),
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20,top: 70),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 110),
                          child: Image(
                            image: AssetImage(
                              'assets/images/logo.png',
                            ),
                            height: 100,
                            width: 100,
                            // alignment: Alignment.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Welcome back!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Login to you account!",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: 55,
                                  width: double.infinity,
                                  decoration:  BoxDecoration(
                                      color: Color(0xFFe6f7ff),
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFcceeff),
                                          // color: Color(0xFFf5ffff),
                                          spreadRadius: 7,
                                          blurRadius: 15,
                                          offset: Offset.zero,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: defaultFormField(
                                      controller: emailController,
                                      type: TextInputType.emailAddress,
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                      },
                                      label: '     Email Address',
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFcceeff),
                                          // color: Color(0xFFf5ffff),
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: Offset.zero,
                                        ),
                                      ]
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFecf4ff),
                                    child: Icon(
                                      Icons.email,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFe6f7ff),
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFcceeff),
                                          // color: Color(0xFFf5ffff),
                                          spreadRadius: 7,
                                          blurRadius: 15,
                                          offset: Offset.zero,
                                        ),
                                      ]
                                  ),
                                  child: defaultFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    suffix: ShopLoginCubit.get(context).suffix,
                                    onSubmit: (value) {
                                      if (formKey.currentState.validate()) {
                                        ShopLoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    isPassword:
                                        ShopLoginCubit.get(context).isPassword,
                                    suffixPressed: () {
                                      ShopLoginCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Password is too short';
                                      }
                                    },
                                    label: '        Password',
                                    prefix: Icons.lock_outline,
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFcceeff),
                                          // color: Color(0xFFf5ffff),
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: Offset.zero,
                                        ),
                                      ]
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFecf4ff),
                                    child: Icon(
                                      Icons.lock_outline_rounded,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'Sign in'),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "-------------------Or sign in with--------------------",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Image(
                                        image: AssetImage('assets/images/logo_google.jpg'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFb3e6ff),
                                            // color: Color(0xFFf5ffff),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 2),
                                          ),
                                        ]
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom:10),
                                      child: Image(
                                        image: AssetImage('assets/images/facebook_logo.png'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFb3e6ff),
                                            // color: Color(0xFFf5ffff),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 2),
                                          ),
                                        ]
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Image(
                                        image: AssetImage('assets/images/twitter-logo2.jpg'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFb3e6ff),
                                            // color: Color(0xFFf5ffff),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 2),
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Don't have an account?"),
                                 defaultTextButton(
                                     function: () {
                                       NavigatorAndFinish(
                                           context, ShopRegisterScreen());
                                     },
                                     text: 'Sign up here'),
                               ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// defaultFormField(
//   controller: emailController,
//   keyboardType: ,
//   validator: (String value) {
//     if (value.isEmpty) {
//       return "Please enter your email address";
//     }
//   },
//   decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5),
//     ),
//     labelText: 'Email Address',
//     labelStyle:
//     TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//     prefixIcon: Icon(Icons.email_outlined),
//   ),
// ),
// SizedBox(height: 15),
// TextFormField(
//   controller: passwordController,
//   keyboardType: TextInputType.visiblePassword,
//   validator: (String value) {
//     if (value.isEmpty) {
//       return "Password is too short";
//     }
//   },
//   decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5),
//     ),
//     labelText: 'Password',
//     labelStyle:
//     TextStyle(
//         fontSize: 17, fontWeight: FontWeight.w600),
//     prefixIcon: Icon(Icons.lock_outlined),
//   ),
// ),
// SizedBox(height: 25),
// Container(
//   width: double.infinity,
//   child: ElevatedButton(
//     onPressed: () {
//       if (formKey.currentState.validate()) {
//         ShopLoginCubit.get(context).userLogin(
//             email: emailController.text,
//             password: passwordController.text);
//       }
//     },
//     child: Text(
//       "Login",
//       style: Theme
//           .of(context)
//           .textTheme
//           .headline4
//           .copyWith(color: Colors.black,),
//       // TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     ),
//     style: ElevatedButton.styleFrom(
//         minimumSize: Size(200,
//             50) // put the width and height you want
//     ),
//   ),
// ),
//SizedBox(height: 15,),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Text("Dont't have an account"),
//     defaultTextButton(function: () {
//       navigatorTo(context, ShopLoginScreen(),
//       );
//     }, text: 'Register',
//     ),
//     TextButton(onPressed:(){
//       Navigator.push(context,MaterialPageRoute(builder: (context){
//         return RegisterScreen();
//       }));
//     },
//       child: Text("Register"),),
//   ],
