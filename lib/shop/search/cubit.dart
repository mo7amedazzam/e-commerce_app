import 'package:ecommerce_app/constans/const.dart';
import 'package:ecommerce_app/helper/dio_helper.dart';
import 'package:ecommerce_app/helper/sp_helper.dart';
import 'package:ecommerce_app/models/search-model.dart';
import 'package:ecommerce_app/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/shop/search/state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState());
      print(error.toString());
    });
  }
}
