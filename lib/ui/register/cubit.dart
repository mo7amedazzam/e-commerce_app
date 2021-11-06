import 'package:ecommerce_app/helper/dio_helper.dart';
import 'package:ecommerce_app/models/register-model.dart';
import 'package:ecommerce_app/remote/end_points.dart';
import 'package:ecommerce_app/ui/register/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel registerModel;

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      RegisterModel.fromJson(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel.data.token);
      print(registerModel.status);
      print(registerModel.message);
      emit(ShopRegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
