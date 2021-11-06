import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/home_model.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  ProductsModel selectProduct;
  HomeModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: BlocConsumer<ShopCubit, ShopeState>(
        listener: (contect, state) {},
        builder: (context, state) {
         return SingleChildScrollView(
           child: Column(
             children: [
               Container(
               height: MediaQuery.of(context).size.height / 3,
               child: CachedNetworkImage(
                 imageUrl: ShopCubit.get(context).productsModel.image),
                ),
               Container(
                 margin: EdgeInsets.all(10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     Row(
                       children: [
                         Expanded(
                           child: Text(
                             'Title: ' + ShopCubit.get(context).productsModel.name,
                             style: TextStyle(fontSize: 25),
                           ),
                         ),
                         Icon(Icons.favorite)
                       ],
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                         'Description: ' +
                             ShopCubit.get(context).productsModel.description,
                         style: TextStyle(fontSize: 20)),
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                         'Price: ' +
                             ShopCubit.get(context).productsModel.price.toString(),
                         style: TextStyle(
                             fontSize: 20,
                             color: Colors.redAccent,
                             fontWeight: FontWeight.w800)),
                   ],
                 ),
               ),
               // GestureDetector(
               //   onTap: () {
               //     provider.addToCart(provider.selectedProduct);
               //   },
               //   child: Container(
               //       margin: EdgeInsets.all(10),
               //       alignment: Alignment.center,
               //       padding: EdgeInsets.symmetric(vertical: 15),
               //       decoration: BoxDecoration(
               //           borderRadius: BorderRadius.circular(15),
               //           color: Colors.blueAccent),
               //       width: double.infinity,
               //       child: Text(
               //         'Add To Cart',
               //         style: TextStyle(
               //             fontSize: 20,
               //             color: Colors.white,
               //             fontWeight: FontWeight.w800),
               //       )),
               // )
             ],
           ),
         );
        },
      ),
    );
  }
}
