import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class UserScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit
            .get(context)
            .userModel;
        if (model != null) {
          nameController.text = model.data.name;
          emailController.text = model.data.email;
          phoneController.text = model.data.phone;
        }

        var formKey = GlobalKey<FormState>();
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => model != null,
          widgetBuilder: (context) =>
              Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: formKey,
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (state is UpdateLoadingState)
                                    LinearProgressIndicator(),
                                  CircleAvatar(
                                      radius: 80,
                                      backgroundImage:
                                      AssetImage('assets/images/user_image.png')),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFormField(
                                    controller: emailController,
                                    validate: (value) {
                                      if (value.isEmpty)
                                        return "Enter Your Email Address Please";
                                    },
                                    prefix: Icons.email,
                                    textLabel: 'Email Address',
                                    textKeyboard: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFormField(
                                    controller: nameController,
                                    validate: (value) {
                                      if (value.isEmpty)
                                        return "Enter your name";
                                    },
                                    prefix: Icons.person,
                                    textLabel: 'Name',
                                    textKeyboard: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFormField(
                                    controller: phoneController,
                                    helper: 'ex: 01xxxxxxxxx',
                                    textKeyboard: TextInputType.phone,
                                    validate: (value) {
                                      if (value.isEmpty )
                                        return 'Number must be enter';
                                      if (value.length ==10 ){
                                        isPhoneNoValid(value);
                                        return 'Number must start with 01';}
                                      if (value.length < 11||value.length > 11 )
                                        return 'Number must be 10 digit';
                                    },
                                    prefix: Icons.phone,
                                    textLabel: 'Phone',
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultButton(
                                    text: 'Update',
                                    fun: () {
                                      if (formKey.currentState.validate()) {
                                        ShopCubit.get(context).updateUserData(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          email: emailController.text,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
          fallbackBuilder: (context) =>
              Center(
                child: CircularProgressIndicator(),
              ),
        );
      },
    );
  }
}
