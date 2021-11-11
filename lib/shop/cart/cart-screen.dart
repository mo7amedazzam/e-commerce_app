import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/models/cart-model.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../color.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Shopping Cart'),
            ),
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) =>
              ShopCubit.get(context).cartModel != null,
              widgetBuilder: (context) {
                return (ShopCubit
                    .get(context)
                    .cartModel
                    .cartDetails
                    .cartItems
                    .length != 0)
                    ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          itemBuilder: (context, index) => cartBuilder(
                            ShopCubit.get(context)
                                .cartModel
                                .cartDetails
                                .cartItems[index],
                            context,
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10.0,
                          ),
                          itemCount: ShopCubit.get(context)
                              .cartModel
                              .cartDetails
                              .cartItems
                              .length,
                        ),
                      ),
                      if (state is CartRemoveLoadingState ||
                          state is CartLoadingUpdateQuantityState ||
                          state is ShopLoadingGetProductDetailsState)
                        LinearProgressIndicator(
                          color: defaultColor,
                        ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  ShopCubit.get(context)
                                      .cartModel
                                      .cartDetails
                                      .total
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  child: defaultButton(
                                    text: 'Check Out',
                                    fun: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cart is EMPTY',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Check our product and order now!',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: defaultButton(
                          text: 'Check Products',
                          fun: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage()));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              fallbackBuilder: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}

Widget cartBuilder(CartItems model, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(model.product.image),
          height: 100,
          width: 100,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                model.product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                model.product.price.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
          backgroundColor: defaultColor,
          radius: 20,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              ShopCubit.get(context).updateQuantityOfInCartProduct(
                  model.id, model.quantity + 1);
            },
            icon: Icon(
              Icons.add,
              color: Colors.grey[350],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(model.quantity.toString(),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                overflow: TextOverflow.ellipsis)),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: defaultColor,
          radius: 20,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              if (model.quantity > 1) {
                ShopCubit.get(context).updateQuantityOfInCartProduct(
                    model.id, model.quantity);
              }
            },
            icon: Icon(
              Icons.remove,
              color: Colors.grey[350],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            ShopCubit.get(context).deleteCarts(model.id);
          },
          icon: Icon(
            Icons.delete_forever,
            color: Colors.red[800],
            size: 30,
          ),
        ),
      ],
    ),
  ),
);
