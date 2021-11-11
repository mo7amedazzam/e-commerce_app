import 'package:ecommerce_app/models/home_model.dart';

class ShopDataProvider{
  Future<HomeDataModel> getShopItems() async {
    List<ProductsModel> shopItems = [
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg',
        price: 25000,
        name: 'Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg',
        price: 44500,
        name: 'Apple MacBook Pro',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg',
        price: 5599,
        oldPrice: 10230,
        name: 'JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg',
        price: 11499,
        oldPrice: 12499,
        name: 'Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg',
        price: 32860,
        oldPrice: 35000,
        name: 'Nikon FX-format D750 - 24.3 MP, SLR Camera 24-120mm Lens, Black',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615451352LMOAF.item_XXL_23705724_34135503.jpeg',
        price: 530,
        name: 'Kingston A400 Internal SSD 2.5\" 240GB SATA 3 - SA400S37/240G',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/161545152160GOl.item_XXL_39275650_152762070.jpeg',
        price: 1083,
        name: 'Stark Iron Kettlebell, 24 KG',
      ),
    ];
    return HomeDataModel(products: shopItems);
  }

  Future<HomeDataModel> getCartItems() async {
    List<ProductsModel> shopItems = [
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg',
        price: 25000,
        name: 'Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg',
        price: 44500,
        name: 'Apple MacBook Pro',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg',
        price: 5599,
        oldPrice: 10230,
        name: 'JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg',
        price: 11499,
        oldPrice: 12499,
        name: 'Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg',
        price: 32860,
        oldPrice: 35000,
        name: 'Nikon FX-format D750 - 24.3 MP, SLR Camera 24-120mm Lens, Black',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/1615451352LMOAF.item_XXL_23705724_34135503.jpeg',
        price: 530,
        name: 'Kingston A400 Internal SSD 2.5\" 240GB SATA 3 - SA400S37/240G',
      ),
      ProductsModel(
        image: 'https://student.valuxapps.com/storage/uploads/products/161545152160GOl.item_XXL_39275650_152762070.jpeg',
        price: 1083,
        name: 'Stark Iron Kettlebell, 24 KG',
      ),
    ];
    return HomeDataModel(products: shopItems);
  }
}