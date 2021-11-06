import 'package:ecommerce_app/models/change_Favorites_model.dart';
import 'package:ecommerce_app/models/login-model.dart';

abstract class ShopeState {}

class ShopInitialStates extends ShopeState {}

class ShopChangeBottomNavState extends ShopeState {}

class ShopChangeModeState extends ShopeState {}

class LoadingHomeDataState extends ShopeState {}

class SuccessHomeDataState extends ShopeState {}

class ErrorHomeDataState extends ShopeState {}

class SuccessCategoriesState extends ShopeState {}

class ErrorCategoriesState extends ShopeState {}

class ChangeFavoritesState extends ShopeState {}

class SuccessChangeFavoritesState extends ShopeState {
  final ChangeFavoritesModel model;

  SuccessChangeFavoritesState(this.model);
}

class ErrorChangeFavoritesState extends ShopeState {}

class LoadingGetFavoritesState extends ShopeState{}

class SuccessGetFavoritesState extends ShopeState {}

class ErrorGetFavoritesState extends ShopeState {}

class LoadingUserDataState extends ShopeState{}

class SuccessUserDataState extends ShopeState {
   final LoginModel loginModel;

   SuccessUserDataState(this.loginModel);
}

class ErrorUserDataState extends ShopeState {}


class LoadingUpdateUserState extends ShopeState{}

class SuccessUpdateUserState extends ShopeState {
  final LoginModel loginModel;

  SuccessUpdateUserState(this.loginModel);
}

class ErrorUpdateUserState extends ShopeState {}

class ErrorChangeCartState extends ShopeState {}

class LoadingGetCartState extends ShopeState{}

class SuccessGetCartState extends ShopeState {}

class ErrorGetCartState extends ShopeState {}