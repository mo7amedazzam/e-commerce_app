class AddToCart {
   bool status;
  InCartDetails inCartDetails;

  AddToCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    inCartDetails = InCartDetails.fromJson(json['data']);
  }
}

class InCartDetails {
   int inCartID;
   int quantity;
  Product product;

  InCartDetails.fromJson(Map<String, dynamic> json) {
    inCartID = json['id'];
    quantity = json['quantity'];
    product = Product.fromJson(json['product']);
  }
}

class Product {
   int id;
   dynamic price;
   dynamic oldPrice;
   dynamic discount;
   String image;
   String name;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
