import 'package:ecommerce_app/helper/sp_helper.dart';
import 'package:ecommerce_app/shop/cart/cart-screen.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'package:ecommerce_app/shop/search/search-screen.dart';
import 'package:ecommerce_app/ui/register/register_screen.dart';
import 'package:ecommerce_app/widget/shop_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../ui/login/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void navigatorTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShopLoginScreen();
    }));

void navigatorTo1(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShopWidget();
    }));

void navigatorTo2(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchScreen();
    }));

// void NavigatorAndFinish(context,
//     widget,
//     ) {
//   Navigator.pushNa(context, MaterialPageRoute(builder: (context) {
//     widget;
//   }), (route) {
//     return false;
//   });
// }
void NavigatorAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void NavigatorAndFinish1(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return SearchScreen();
  }));
}

void NavigatorAndFinish2(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ShopWidget();
  }));
}
void NavigatorAndFinish3(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ShopLoginScreen();
  }));
}

void navigatorToCart(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CartScreen();
    }));

void NavigatorAndFinishToHome(context, widget) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return ShopWidget();
  }));
}


Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toLowerCase(),
        style: TextStyle(
          color: Colors.blue,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );

Widget defaultButton({
  @required Function function,
  @required String text,
  double width,
  double height,
  Color background,
}) =>
    Align(
      alignment:Alignment.center ,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF0099e6),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFb3e6ff),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset.zero,
              ),
            ]
        ),
        width: 150,
        height: 50,
        child: MaterialButton(
          onPressed: function,
          child: Align(
              alignment: Alignment.center,
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900))),
        ),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextField(

      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
     // onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      //validator: validate,
      // cursorColor: Colors.grey,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        enabledBorder: InputBorder.none,
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),),
      ),
    );

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

void signOut(context) {
  SpHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigatorTo(context, ShopLoginScreen());
    }
  });
}

Widget buildListProductFav(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120,
                  height: 120,
                  //fit: BoxFit.cover,
                ),
                if (model.discount != 0 && isOldPrice)
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
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              ShopCubit.get(context).favorites[model.id]
                                  ? Colors.amber
                                  : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget buildListProductCart(
    model,
    context, {
      bool isOldPrice = true,
    }) =>
    Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120,
                  height: 120,
                  //fit: BoxFit.cover,
                ),
                // if (model.discount != 0 && isOldPrice)
                //   Container(
                //     color: Colors.red,
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 5.0,
                //     ),
                //     child: Text(
                //       'DISCOUNT',
                //       style: TextStyle(
                //         fontSize: 9.0,
                //         color: Colors.white,
                //       ),
                //     ),
                //   )
              ],
            ),
            // SizedBox(
            //   width: 20,
            // ),
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         model.name,
            //         maxLines: 2,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //           fontSize: 14,
            //           height: 1.3,
            //         ),
            //       ),
            //       Spacer(),
            //       Row(
            //         children: [
            //           Text(
            //             model.price.toString(),
            //             maxLines: 2,
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //               fontSize: 12,
            //               color: Colors.blueAccent,
            //             ),
            //           ),
            //           SizedBox(
            //             width: 5,
            //           ),
            //           if (model.discount != 0 && isOldPrice)
            //             Text(
            //               model.oldPrice.toString(),
            //               maxLines: 2,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(
            //                 fontSize: 10.0,
            //                 color: Colors.grey,
            //                 decoration: TextDecoration.lineThrough,
            //               ),
            //             ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );

