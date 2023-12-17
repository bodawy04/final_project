class Profile {
  User? user;
  String? token;

  Profile({this.user, this.token});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? bio;
  String? address;
  String? mobile;
  String? image;
  String? CV;

  User({this.id, this.name, this.email,this.bio,this.address,this.mobile,this.image,this.CV});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    bio = json['bio'];
    address = json['address'];
    mobile = json['mobile'];
    image = json['image'];
    CV = json['cv_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['cv_file'] = this.CV;
    return data;
  }
}
