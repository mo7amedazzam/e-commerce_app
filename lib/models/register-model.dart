class RegisterModel {
  bool status;
  String message;
  userRegisterData data;


  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new userRegisterData.fromJson(json['data']) : null;
  }

}

class userRegisterData {
  String name;
  String phone;
  String email;
  int id;
  String image;
  String token;


  userRegisterData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }
}