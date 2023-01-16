


class User_Model{
  String? email;
  String? mobileNumber;
  String? password;
  String? uid;

  User_Model(this.email,this.mobileNumber,this.password,this.uid,);

  //--------------- bind user data our model
  User_Model.fronJson(Map<String , dynamic> json)
  : email = json["email"],
        mobileNumber = json["mobileNumber"],
        password = json["password"],
        uid = json["uid"];

}