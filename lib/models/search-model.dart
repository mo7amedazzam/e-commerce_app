class SearchModel {
   bool status;
   SearchData searchData;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    searchData = SearchData.fromJson(json['data']);
  }
}

class SearchData {
  List<Product> productsData = [];

  SearchData.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      productsData.add(Product.fromJson(element));
    });
  }
}

class Product {
   int id;
   dynamic price;
   String image;
   String name;
   String description;
   bool inFavorites;
   bool inCart;
   List<String> images = [];

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    json['images'].forEach((element) {
      images.add(element);
    });
  }
}
