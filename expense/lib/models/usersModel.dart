class User {
 final String userID;
 final String userName;
 final String phoneNo;
 final String email;
 final String address;
 final String password;
 final String createdAt;

 User({
    required this.userID,
    required this.userName,
    required this.phoneNo,
    required this.email,
    required this.address,
    required this.password,
    required this.createdAt,
 });

 // Method to convert User object to JSON
 Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'phoneNo': phoneNo,
        'email': email,
        'address': address,
        'password': password,
        'createdAt': createdAt,
      };

 // Factory method to create User object from JSON
 factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      userName: json['userName'],
      phoneNo: json['phoneNo'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
      createdAt: json['createdAt'],
    );
 }
}
