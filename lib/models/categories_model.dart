class CategoriesModel {
  bool status;
  CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new CategoriesDataModel.fromJson(json['data']) : null;
  }
}


class CategoriesDataModel {
  int currentPage;
  List<DataModel> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if(json['data'] != null)
      {
        data = new List<DataModel>();
        json['data'].forEach((element){
          data.add(new DataModel.fromJson(element));
        });
      }
    // if(json['data'] != null)
    //   {
    //     json['data'].forEech((element)
    //     {
    //       data.add(new DataModel.fromJson(element));
    //     });
    //   }
  }
}

class DataModel {
  int id;
  String name;
  String image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
