// import 'package:ecommerce_app/ui/cubit/cubit.dart';
// import 'package:flutter/material.dart';
//
// class CustomButton extends StatelessWidget {
//   var formKey = GlobalKey<FormState>();
//
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           if (formKey.currentState.validate()) {
//             LoginCubit.get(context).userLogin(
//                 email: emailController.text, password: passwordController.text);
//           }
//         },
//         child: Text(
//           "Login",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         style: ElevatedButton.styleFrom(
//             minimumSize: Size(200, 50) // put the width and height you want
//             ),
//       ),
//     );
//   }
// }
