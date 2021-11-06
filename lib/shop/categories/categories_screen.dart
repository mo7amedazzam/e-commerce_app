import '../../models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import '../cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
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
                      "Category",
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
                  size: 30,)
              ),
            ),
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => buildCatItem(
                ShopCubit.get(context).categoriesModel.data.data[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: ShopCubit.get(context).categoriesModel.data.data.length,
          ),
        );
      },
    );
  }
}

Widget buildCatItem(DataModel dataModel) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          /*
      decoration: BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),

                  image:NetworkImage('${e.image}'),
              ),
          ),
       */
          Image(
            image: NetworkImage(dataModel.image),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            dataModel.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          )
        ],
      ),
    );
