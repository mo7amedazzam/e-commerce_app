import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/models/favorites_model.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import 'package:ecommerce_app/widget/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    //663399  //8A2BE2  //9932CC  //9400D3
                    colors: [Color(0xFF4B0082), Color(0xFF9966cc)],
                    stops: [0.3, 1.0],
                  )),
            ),
            backgroundColor: Colors.deepPurpleAccent,
            title: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "Favorite",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon:Icon(Icons.arrow_back_ios,color: Colors.white,
                  size: 30,),
                onPressed: (){
                  NavigatorAndFinishToHome(context, HomePage());
                },
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! LoadingGetFavoritesState,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildListProductFav(
                  ShopCubit.get(context).favoritesModel.data.data[index].product,
                  context),
              separatorBuilder: (context, index) => Divider(),
              itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
            ),
            fallback: (context) => Center(child: CircularProgressIndicator(),),
          ),
        );
      },
    );
  }
}

