class ProductDetailsModel {
   bool status;
   ProductModel productModel;

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    productModel = ProductModel.fromJson(json['data']);
  }
}

class ProductModel {
   int id;
   dynamic price;
   dynamic oldPrice;
   dynamic discount;
   String image;
   String name;
   bool inFavorites;
   bool inCart;
   List<dynamic> images;
   String description;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    images = json['images'];
    description = json['description'];
  }
}
