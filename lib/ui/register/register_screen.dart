import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/helper/sp_helper.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'package:ecommerce_app/ui/login/cubit/cubit.dart';
import 'package:ecommerce_app/ui/login/login_screen/login_screen.dart';
import 'package:ecommerce_app/ui/login/states.dart';
import 'package:ecommerce_app/ui/register/cubit.dart';
import 'package:ecommerce_app/ui/register/states.dart';
import 'package:ecommerce_app/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.registerModel.status) {
              print(state.registerModel.message);
              print(state.registerModel.data.token);

              SpHelper.saveData(
                key: 'token',
                value: state.registerModel.data.token,
              ).then((value) {
                state.registerModel.data.token;
                navigatorTo1(
                  context,
                  ShopWidget(),
                );
              });
            } else {
              print(state.registerModel.message);
              showToast(
                  text: state.registerModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
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
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Create a new account",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue,
                                fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Text(
                        //     "Create a new account",
                        //     style: TextStyle(
                        //       fontSize: 17,
                        //       color: Colors.grey[600],
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: 25,
                        ),
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
                                      blurRadius: 10,
                                      offset: Offset.zero,
                                    ),
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                  },
                                  label: '     User name',
                                ),
                              ),
                            ),
                            Container(
                              height: 68,
                              width: 68,
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
                                  ]),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFecf4ff),
                                child: Icon(
                                  Icons.person_outline,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // defaultFormField(
                        //   controller: nameController,
                        //   type: TextInputType.name,
                        //   validate: (String value) {
                        //     if (value.isEmpty) {
                        //       return 'Please enter your name';
                        //     }
                        //   },
                        //   label: 'User Name',
                        //   prefix: Icons.person,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
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
                                      blurRadius: 10,
                                      offset: Offset.zero,
                                    ),
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                              height: 68,
                              width: 68,
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
                                  ]),
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
                        SizedBox(
                          height: 15,
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
                                          blurRadius: 10,
                                          offset: Offset.zero,
                                        ),
                                      ]),
                                  child: defaultFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    suffix:
                                        ShopRegisterCubit.get(context).suffix,
                                    onSubmit: (value) {
                                      // if (formKey.currentState.validate()) {
                                      //   ShopLoginCubit.get(context).userLogin(
                                      //       email: emailController.text,
                                      //       password: passwordController.text);
                                      // }
                                    },
                                    isPassword: ShopRegisterCubit.get(context)
                                        .isPassword,
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
                                  height: 70,
                                  width: 70,
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
                                      ]),
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
                          height: 15,
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
                                          blurRadius: 10,
                                          offset: Offset.zero,
                                        ),
                                      ]),
                                  child: defaultFormField(
                                    controller: phoneController,
                                    type: TextInputType.phone,
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your phone';
                                      }
                                    },
                                    label: '        Phone',
                                    prefix: Icons.phone,
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 70,
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
                                      ]),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFecf4ff),
                                    child: Icon(
                                      Icons.phone,
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
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'Sign up',
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     defaultTextButton(
                      //         function: () {
                      //           navigatorTo(context, HomePage());
                      //         },
                      //         text: 'OR \n Login',)
                      //   ],
                      // ),
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
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "");
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.black,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
