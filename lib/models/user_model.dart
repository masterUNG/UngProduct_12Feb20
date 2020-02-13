class UserModel {

  // Field
  String id, name, user, password;


  // Method
  UserModel(this.id, this.name, this.user, this.password);

  UserModel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    name = map['Name'];
    user = map['User'];
    password = map['Password'];
  }


  
}