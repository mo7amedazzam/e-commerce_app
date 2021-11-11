import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'package:ecommerce_app/widget/shop_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/components/components.dart';

class ProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;

        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;

        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Scaffold(
                body: ConditionalBuilder(
                  condition: ShopCubit.get(context).userModel != null,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (state is LoadingUpdateUserState)
                              LinearProgressIndicator(),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'name must not be empty';
                                }
                                return null;
                              },
                              label: 'Name',
                              prefix: Icons.person,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'email must not be empty';
                                }
                              },
                              label: 'Email',
                              prefix: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'phone must not be empty';
                                }
                              },
                              label: 'Phone',
                              prefix: Icons.phone,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  ShopCubit.get(context).updateUserData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              text: 'Update',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultButton(
                              function: () {
                                signOut(context);
                              },
                              text: "Logout",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(130)),
                gradient: LinearGradient(
                  //663399  //8A2BE2  //9932CC  //9400D3
                  colors: [Color(0xFF6800b3), Color(0xFFbf66ff)],
                  stops: [0.3, 1.0],
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10 ,right: 10, bottom: 15, top: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/my_image.png'),
                            radius: 40,
                          ),
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Mohammed Ghassan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
