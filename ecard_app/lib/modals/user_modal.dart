class User{
  int? userId;
  String? username;
  String? phoneNumber;
  String? email;
  String? type;
  String? accessToken;
  String? refreshToken;

  User({this.userId, this.username, this.phoneNumber,this.email, this.type, this.accessToken, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> responseData){
    return User(
      userId: responseData['id'],
      username: responseData['username'],
      phoneNumber: responseData['phoneNumber'],
      email : responseData["email"],
      type: responseData['userType'],
      accessToken: responseData['accessToken'],
      refreshToken: responseData['refreshToken']
    );
  }
}