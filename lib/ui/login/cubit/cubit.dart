import 'package:ecommerce_app/constans/const.dart';
import 'package:ecommerce_app/helper/dio_helper.dart';
import 'package:ecommerce_app/remote/end_points.dart';
import 'package:ecommerce_app/ui/login/states.dart';
import '../../../models/login-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel;

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      LoginModel.fromJson(value.data);
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.data.token);
      print(loginModel.status);
      print(loginModel.message);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ShopChangePasswordVisibilityState());
  }
}
