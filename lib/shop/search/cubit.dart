import 'package:ecommerce_app/constans/const.dart';
import 'package:ecommerce_app/helper/dio_helper.dart';
import 'package:ecommerce_app/helper/sp_helper.dart';
import 'package:ecommerce_app/models/search-model.dart';
import 'package:ecommerce_app/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/shop/search/state.dart';


class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel searchModel;

  void search(String text) {
    emit(LoadingSearchState());
    DioHelper.postData(url: SEARCH, token: token, data: {'text': text})
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(DoneSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearchState());
    });
  }
}

