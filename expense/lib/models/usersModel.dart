class UsersModel{
  final String userName;
  final String email;
  UsersModel( {required this.userName, required this.email});
  factory UsersModel.fromJson(Map<String,dynamic>json){
    return UsersModel(userName: json['userName']??'', email: json['email']??'');
  }
  
}
