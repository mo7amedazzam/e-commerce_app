// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce_app/components/components.dart';
// import 'package:ecommerce_app/models/home_model.dart';
// import 'package:ecommerce_app/shop/cubit/cubit.dart';
// import 'package:ecommerce_app/shop/cubit/states.dart';
// import 'package:ecommerce_app/shop/home/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'cart/cart-screen.dart';
//
// class ProductDetails extends StatelessWidget {
//   ProductsModel selectProduct;
//   HomeModel model;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Product Details"),
//       ),
//       body: BlocConsumer<ShopCubit, ShopeState>(
//         listener: (contect, state) {},
//         builder: (context, state) {
//          return ShopCubit.get(context).selectedProduct == null
//              ? Center(child: CircularProgressIndicator(),
//             )
//            : SingleChildScrollView(
//              child: Column(
//                children: [
//                  Container(
//                  height: MediaQuery.of(context).size.height / 3,
//                  child: CachedNetworkImage(
//                    imageUrl: ShopCubit.get(context).selectedProduct.image),
//                   ),
//                  Container(
//                    margin: EdgeInsets.all(10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        SizedBox(
//                          height: 10,
//                        ),
//                        Row(
//                          children: [
//                            Expanded(
//                              child: Text(
//                                'Title: ' +  ShopCubit.get(context).selectedProduct.name,
//                                style: TextStyle(fontSize: 25),
//                              ),
//                            ),
//                            Icon(Icons.favorite)
//                          ],
//                        ),
//                        SizedBox(
//                          height: 10,
//                        ),
//                        Text(
//                            'Description: ' +
//                                ShopCubit.get(context).selectedProduct.description,
//                            style: TextStyle(fontSize: 20)),
//                        SizedBox(
//                          height: 10,
//                        ),
//                        Text(
//                            'Price: ' +
//                                ShopCubit.get(context).selectedProduct.price.toString(),
//                            style: TextStyle(
//                                fontSize: 20,
//                                color: Colors.redAccent,
//                                fontWeight: FontWeight.w800)),
//                      ],
//                    ),
//                  ),
//                            GestureDetector(
//                              onTap: (){
//                                ShopCubit.get(context).addToCart(ShopCubit.get(context).selectedProduct);
//                              },
//                              child: Container(
//                                  margin: EdgeInsets.all(10),
//                                  alignment: Alignment.center,
//                                  padding: EdgeInsets.symmetric(vertical: 15),
//                                  decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15),
//                                      color: Colors.blueAccent),
//                                  width: double.infinity,
//                                  child: Text(
//                                    'Add To Cart',
//                                    style: TextStyle(
//                                        fontSize: 20,
//                                        color: Colors.white,
//                                        fontWeight: FontWeight.w800),
//                                  )),
//                             )
//                          ],
//                        ),
//            );
//         },
//       ),
//     );
//   }
// }
// Widget buildGridProduct(ProductsModel model, context) =>
//     Container(
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children: [
//               GestureDetector(
//                 onTap: (){
//                   navigatorToCart(context, CartScreen);
//                 },
//                 child: Image(
//                   image: NetworkImage(model.image),
//                   width: double.infinity,
//                   height: 180,
//                 ),
//               ),
//               if (model.discount != 0)
//                 Container(
//                   color: Colors.red,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 5.0,
//                   ),
//                   child: Text(
//                     'DISCOUNT',
//                     style: TextStyle(
//                       fontSize: 9.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 12, right: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //   Container(
//                 //     height: 10,
//                 //     child: RatingBar.builder(
//                 //     initialRating: 3,
//                 //     minRating: 1,
//                 //     direction: Axis.horizontal,
//                 //     allowHalfRating: true,
//                 //     itemCount: 3,
//                 //     //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                 //     itemBuilder: (context, _) => Icon(
//                 //       Icons.star,
//                 //       size: 10,
//                 //       color: Colors.amber,
//                 //     ),
//                 //     onRatingUpdate: (rating) {
//                 //       print(rating);
//                 //     },
//                 // ),
//                 //   ),
//                 // SizedBox(height: 5,),
//                 Text(
//                   model.name,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 14,
//                     height: 1.3,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '${model.price.round()}' + '\$',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     if (model.discount != 0)
//                       Text(
//                         '${model.oldPrice.round()}',
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 10.0,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                           decorationColor: Colors.red,
//                         ),
//                       ),
//                     Spacer(),
//                     IconButton(
//                       onPressed: () {
//                         ShopCubit.get(context).changeFavorites(model.id);
//                         print(model.id);
//                       },
//                       icon: CircleAvatar(
//                         radius: 15.0,
//                         backgroundColor:
//                         ShopCubit.get(context).favorites[model.id]
//                             ? Colors.amber
//                             : Colors.grey[400],
//                         child: Icon(
//                           Icons.favorite_border,
//                           size: 14.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
