import 'package:dio/dio.dart';
import 'package:ecommerce_app/constans/const.dart';
import 'package:ecommerce_app/helper/db_helper.dart';
import 'package:ecommerce_app/helper/dio_helper.dart';
import 'package:ecommerce_app/models/cart-model.dart';
import 'package:ecommerce_app/models/change_Favorites_model.dart';
import 'package:ecommerce_app/models/favorites_model.dart';
import 'package:ecommerce_app/models/login-model.dart';
import 'package:ecommerce_app/remote/end_points.dart';
import 'package:ecommerce_app/shop/categories/categories_screen.dart';
import 'package:ecommerce_app/ui/login/login_screen/login_screen.dart';
import '../../models/categories_model.dart';
import 'package:ecommerce_app/shop/favorites/favorites_screen.dart';
import 'package:ecommerce_app/shop/home/home_page.dart';
import '../../models/home_model.dart';
import 'package:ecommerce_app/shop/profile/profile_screen.dart';
import 'states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopeState>{
  ShopCubit() : super(ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  ValueNotifier<Options> option;

  // Option get _option => option.value;
  // OptionData get _optionData => optionData[_option];
  // void _onSelectOption(Option selectedOption){
  // option.value = selectedOption;
  // }

  List<Widget> bottomScreen = [
    HomePage(),
    CategoriesScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
  ProductsModel productsModel;
  HomeModel homeModel;
  Map<int, bool> favorites = {};
  Map<int, bool> cart = {};
  void getHomoeData()
  {
    emit(LoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

      // printFullText(homeModel.data.banners[0].image);
      // print(homeModel.status);

      homeModel.data.products.forEach((element) 
      {
        favorites.addAll({
          element.id : element.inFavorites,
        });

      });
      homeModel.data.products.forEach((element)
      {
        cart.addAll({
          element.id : element.inCart,
        });
      });

      //print(favorites.toString());

      emit(SuccessHomeDataState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategories()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(SuccessCategoriesState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorCategoriesState());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;
  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId];
    DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id': productId,
        },
      token: token,
    ).then((value)
    {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if(!changeFavoritesModel.status)
        {
          favorites[productId] = !favorites[productId];
        }
      else
        {
          getFavorites();
        }

      emit(SuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error)
    {
      favorites[productId] = !favorites[productId];

      emit(ErrorChangeFavoritesState());
    });
  }

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool fromShared}) {
    isDark = !isDark;
    emit(ShopChangeModeState());
  }

  FavoritesModel favoritesModel;
  void getFavorites()
  {
    emit(LoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value)
    {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(SuccessGetFavoritesState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorGetFavoritesState());
    });
  }

  LoginModel userModel;
  void getUserData()
  {
    emit(LoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value)
    {
      userModel = LoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(SuccessUserDataState(userModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorUserDataState());
    });
  }

  void updateUserData({
  @required String name,
  @required String email,
  @required String phone,
})
  {
    emit(LoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value)
    {
      userModel = LoginModel.fromJson(value.data);
      printFullText(userModel.data.name);
      printFullText(userModel.data.email);
      printFullText(userModel.data.phone);

      emit(SuccessUpdateUserState(userModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorUpdateUserState());
    });
  }

  CartModel cartModel;
  void getCart()
  {
    emit(LoadingGetCartState());

    DioHelper.postData(
      url: CART,
      token: token,
    ).then((value)
    {
      cartModel = CartModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(SuccessGetCartState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorGetCartState());
    });
  }

  List<ProductsModel>cartProducts;

  addToCart(ProductsModel productsModel) async {
    bool productInCart = cartProducts == null
        ? false
        : cartProducts.any((x) {
      return x.id == productsModel.id;
    });

    getAllCartProdcts();
  }

  updateProductInCart(ProductsModel productsModel) async {
    await DpHelper.dpHelper.updateProductQuantity(productsModel);
    getAllCartProdcts();
  }
  deleteFromCart(int id) async {
    await DpHelper.dpHelper.deleteProductFromCart(id);
    getAllCartProdcts();
  }

  getAllCartProdcts() async {
    List<ProductsModel> products = await DpHelper.dpHelper.getAllCart();
    this.cartProducts = products;
    cartProducts.forEach((element) {
    });
    // notifyListeners();
  }
}
