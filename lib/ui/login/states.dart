import '../../models/login-model.dart';

abstract class ShopLoginState{}

class ShopLoginInitialState extends ShopLoginState{}

class ShopLoginLoadingState extends ShopLoginState{}

class ShopLoginSuccessState extends ShopLoginState{
   final LoginModel loginModel;
   ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginState{
   String error;
   ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginState{}


