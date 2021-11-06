import 'package:ecommerce_app/components/components.dart';
import 'package:ecommerce_app/shop/cubit/cubit.dart';
import 'package:ecommerce_app/shop/favorites/favorites_screen.dart';
import 'package:ecommerce_app/shop/search/cubit.dart';
import 'package:ecommerce_app/shop/search/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var fromKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'enater text to search';
                          }
                          return null;
                        },
                        onSubmit: (String text) {
                          SearchCubit.get(context).search(text);
                        },
                        label: 'Search',
                        prefix: Icons.search,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (state is SearchLoadingState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      if(state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildListProductFav(
                              SearchCubit.get(context).model.data.data[index],
                              context,isOldPrice: false),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount:
                              SearchCubit.get(context).model.data.data.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
