import 'package:ecommerce_app/models/change_Favorites_model.dart';
import 'package:ecommerce_app/models/home_model.dart';
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


class ShopPageLoadingState extends ShopeState{
  HomeDataModel shopData;
  HomeDataModel cartData;
  ShopPageLoadingState({this.cartData,this.shopData});

}
class ItemAddingCartState extends ShopeState {
  HomeDataModel cartModel;
  List<ProductsModel> cartItems;
  ItemAddingCartState({this.cartItems,this.cartModel});
}
class ItemAddedCartState extends ShopeState {
  List<ProductsModel> cartItems;
  ItemAddedCartState({this.cartItems});
}
class ItemDeletingCartState extends ShopeState{
  List<ProductsModel> cartItems;
  ItemDeletingCartState({this.cartItems});
}

class UserLoadingState extends ShopeState {}

class UserSuccessState extends ShopeState {}

class UserErrorState extends ShopeState {}
class UpdateLoadingState extends ShopeState {}

class UpdateSuccessState extends ShopeState {
  final LoginModel model;

  UpdateSuccessState(this.model);

}

class CartSuccessState extends ShopeState {}

class CartErrorState extends ShopeState {}
class CartLoadingState extends ShopeState {}
class CartAddSuccessState extends ShopeState {}

class CartAddErrorState extends ShopeState {}
class CartAddLoadingState extends ShopeState {}
class CartRemoveSuccessState extends ShopeState {}

class CartRemoveErrorState extends ShopeState {}
class CartRemoveLoadingState extends ShopeState {}
class CartSuccessUpdateQuantityState extends ShopeState {}

class ShopLoadingGetProductDetailsState extends ShopeState {}

class ShopSuccessGetProductDetailsState extends ShopeState {}

class ShopErrorGetProductDetailsState extends ShopeState {}
class CartErrorUpdateQuantityState extends ShopeState {}
class CartLoadingUpdateQuantityState extends ShopeState {}
