
import 'package:dio/dio.dart';

class UserModel{
  late String title;
  late String category;

  UserModel(this.title,this.category);

  factory UserModel.fromJSON(Map<String,dynamic> fromJson){
    title=fromJson['title'];
    category=fromJson['category'];
    return UserModel(title, category);
  }
}

List<dynamic> BigList=[];

Future<dynamic> data() async {
  // final data={"email":em,"password":pass};
  final dio=Dio();
  Response resp;
  resp=await dio.get("https://fakestoreapi.com/products/1");
  if (resp.statusCode==200){
    final body=resp.data;
    print(body);
    print("Succeed");
    UserModel.fromJSON(body);
  }
  else {
    print("FAiled");
    // return UserModel("failed", "failed");
  }
}

void main() {
  data();
}
