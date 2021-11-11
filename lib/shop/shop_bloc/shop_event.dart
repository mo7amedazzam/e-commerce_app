import 'package:ecommerce_app/models/home_model.dart';
import 'package:equatable/equatable.dart';

abstract class ShopEvent extends Equatable{
 const ShopEvent();

 @override
 List<Object> get props => [];
}
class ShopPageInitializedEvent extends ShopEvent{
   List<ProductsModel> cartItems;
   ShopPageInitializedEvent({this.cartItems});
}
class ItemAddingCartEvent extends ShopEvent{
 List<ProductsModel> cartItems;
 ItemAddingCartEvent({this.cartItems});
}
class ItemAddedCartEvent extends ShopEvent{
 List<ProductsModel> cartItems;
 ItemAddedCartEvent({this.cartItems});
}
class ItemDeleteCartEvent extends ShopEvent{
 List<ProductsModel> cartItems;
 int index;
 ItemDeleteCartEvent({this.cartItems,this.index});
}
