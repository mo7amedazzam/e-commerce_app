import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/models/home_model.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        leading: IconButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: FutureBuilder<List<ProductsModel>>(
            builder: (context, state) {
              if (state.connectionState == ConnectionState.done)
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) =>
                      Card(
                        child: ListTile(
                          onTap: () {},
                          title: Container(
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image(
                                    image: NetworkImage(
                                        state.data[index].image),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                    child: Text(
                                      state.data[index].name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${state.data[index].price}\$'
                                    ),
                                    SizedBox(
                                      width: 15,),
                                    state.data[index].price > 0
                                        ? Text('${(state.data[index].price -
                                        (state.data[index].price *
                                            state.data[index].price)).toStringAsFixed(2)}')
                                        : Container()
                                 ],),
                                ),
                                IconButton(icon: Icon(CupertinoIcons.shopping_cart),
                                onPressed: (){},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                );
              return Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      ),
    );
  }
}
