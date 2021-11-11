import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
      ),
      body: Container(
        height: 230,
        width: double.infinity,
        child: Image(
          image: AssetImage('assets/images/my_image.png'),
          fit: BoxFit.cover,),
      ),
    );
  }

}