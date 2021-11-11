import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();

  Future<dynamic> getSpecificProduct(int id) async {
    String url = 'https://student.valuxapps.com/storage/uploads/products/$id';
    Response response = await dio.get(url);
    return response.data;
  }
  // Future<List<dynamic>> getCategoryProducts(String categoryName) async {
  //   String url = 'https://student.valuxapps.com/storage/uploads/categories/$categoryName';
  //   Response response = await dio.get(url);
  //   List<dynamic> products = response.data;
  //   return products;
  // }
}
