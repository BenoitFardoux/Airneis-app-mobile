class UserModel {
  final int id;
  final String lastName;
  final String firstName;
  final String email;
  

  UserModel({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.email,
 
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      email: json['email'],
      
    );
  }
}
