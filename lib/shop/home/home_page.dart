import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/coustom_color/custom_color.dart';
import 'package:ecommerce_app/shop/cart/cart-screen.dart';
import 'package:ecommerce_app/shop/cart/product-cart.dart';
import 'package:ecommerce_app/shop/product-details.dart';
import 'package:ecommerce_app/shop/search/search-screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/categories_model.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import '../../models/home_model.dart';
import '../cubit/states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'home page';
  Color color = const Color(0xffb6f2fed);
  Color color2 = Color(0xFF9933ff);
  Color color3 = Color(0xFFCE93DB);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
      listener: (context, state) {
        if (state is SuccessChangeFavoritesState) {
          if (!state.model.status) {
            showToast(
              text: state.model.message,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        //663399  //8A2BE2  //9932CC  //9400D3
                        colors: [Color(0xFF4B0082), Color(0xFF9966cc)],
                        stops: [0.3, 1.0],
                      )),
                ),
                elevation: 0.0,
                backgroundColor: Colors.deepPurpleAccent,
                leading: Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 10),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        navigatorTo2(context, SearchScreen());
                      },
                    )),
                title: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "My",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          "Shop",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5, bottom: 10),
                    child: Icon(
                      Icons.notification_important_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 40),
                    child: ConditionalBuilder(
                      condition: cubit.homeModel != null &&
                          cubit.categoriesModel != null,
                      builder: (context) =>
                          productsBuilder(
                              cubit.homeModel,
                              cubit.categoriesModel,
                              context),
                      fallback: (context) =>
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: GestureDetector(
                  onTap: () {
                    navigatorTo2(context, SearchScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget productsBuilder(HomeModel model, CategoriesModel categoriesModel,
    context) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              CarouselSlider(
                items: model.data.banners
                    .map(
                      (e) =>
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.9),
                                BlendMode.dstATop),
                            image: NetworkImage('${e.image}'),
                          ),
                        ),
                        // child: Image(
                        //   image: NetworkImage('${e.image}'),
                        //   width: double.infinity,
                        //   // height: 150,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                )
                    .toList(),
                options: CarouselOptions(
                  height: 100,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Fashion Sale",
                  style: TextStyle(
                      color: Colors.black.withOpacity(1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //   Text(
          //     "Categories",
          //     style: TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          //   Container(
          //     height: 100.0,
          //     child: ListView.separated(
          //      physics: BouncingScrollPhysics(),
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) => buildCategoryItem(categoriesModel.data.data[index]),
          //       separatorBuilder: (context, incdex) => SizedBox(
          //         width: 10,
          //       ),
          //       itemCount: categoriesModel.data.data.length,
          // ),
          //   ),
          //   Text(
          //     "New Products",
          //     style: TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        buildCategoryItem(categoriesModel.data.data[index]),
                    separatorBuilder: (context, incdex) =>
                        SizedBox(
                          width: 10,
                        ),
                    itemCount: categoriesModel.data.data.length,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Products",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1 / 1.90,
                children: List.generate(
                  model.data.products.length,
                      (index) =>
                      buildGridProduct(model.data.products[index], context),
                )),
          ),
        ],
      ),
    );

Widget buildCategoryItem(DataModel model) =>
    Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              model.name,
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black,
                BlendMode.dstATop,
              ),
              image: NetworkImage(model.image),
            ),
          ),
        ),
        /*
        BoxDecoration(
  color: const Color(0xff7c94b6),
  image: new DecorationImage(
    fit: BoxFit.cover,
    colorFilter:
      ColorFilter.mode(Colors.black.withOpacity(0.2),
      BlendMode.dstATop),
    image: new NetworkImage(
      'http://www.server.com/image.jpg',
    ),
  ),
),
         */
        // Image(
        //   image: NetworkImage(model.image),
        //   height: 100,
        //   width: 100,
        //   fit: BoxFit.cover,
        // ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Text(
        //     model.name,
        //     textAlign: TextAlign.center,
        //     maxLines: 2,
        //     style: TextStyle(
        //       color: Colors.black.withOpacity(0.9),
        //       fontSize: 15,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        // Container(
        //   color: Colors.black.withOpacity(0.7),
        //   width: 70,
        //   // height: double.infinity,
        //   child: Text(
        //     model.name,
        //     textAlign: TextAlign.center,
        //     maxLines: 1,
        //     overflow: TextOverflow.visible,
        //     style: TextStyle(
        //       color: Colors.white,
        //     ),
        //   ),
        // )
      ],
    );

Widget buildGridProduct(ProductsModel model, context) =>
    GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) {
        //       return ProductDetails();
        //     }));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: double.infinity,
                  height: 180,
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //   Container(
                //     height: 10,
                //     child: RatingBar.builder(
                //     initialRating: 3,
                //     minRating: 1,
                //     direction: Axis.horizontal,
                //     allowHalfRating: true,
                //     itemCount: 3,
                //     //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                //     itemBuilder: (context, _) => Icon(
                //       Icons.star,
                //       size: 10,
                //       color: Colors.amber,
                //     ),
                //     onRatingUpdate: (rating) {
                //       print(rating);
                //     },
                // ),
                //   ),
                // SizedBox(height: 5,),
                Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price.round()}' + '\$',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (model.discount != 0)
                    Text(
                      '${model.oldPrice.round()}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      ShopCubit.get(context).changeFavorites(model.id);
                      print(model.id);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor:
                      ShopCubit
                          .get(context)
                          .favorites[model.id]
                          ? Colors.amber
                          : Colors.grey[400],
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              defaultButton2(text: 'Add to cart', fun: () {
                ShopCubit.get(context).addCarts(model.id);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Added to cart successfully!'),
                      padding: EdgeInsetsDirectional.all(20),
                      duration: Duration(milliseconds: 800),
                    )
                );
              },
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

// new Stack(
//   children: [
//     Padding(
//       padding: const EdgeInsets.only(right: 17,left: 17),
//       child: GestureDetector(
//         onTap: (){
//         NavigatorAndFinish(context, SearchScreen());
//         },
//         child: Container(
//           padding: EdgeInsets.only(left: 15),
//           height: 45,
//           width: double.infinity,
//           child: Align(
//               alignment: Alignment.centerRight,
//               child: Align(alignment: Alignment.centerLeft,child: Icon(Icons.search_rounded,size: 25,))),
//           decoration: BoxDecoration(color: Colors.white,
//             borderRadius: BorderRadius.circular(25),
//           ),
//         ),
//       ),
//     )
//   ],
// ),
// appBar: PreferredSize(
//   preferredSize: Size.fromHeight(70),
//   child: AppBar(
//     backgroundColor: Colors.deepPurpleAccent,
//     leading: Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: Icon(Icons.menu),
//     ),
//     title: Align(
//       alignment: Alignment.topCenter,
//       child: Text(
//         "MyShop",
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 23,
//           color: Colors.white,
//         ),
//       ),
//     ),
//     actions: [
//       Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child: Icon(Icons.notification_important),
//       )
//     ],
//   ),
// ),
