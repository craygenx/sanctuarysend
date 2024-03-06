class RegistrationModel {
  String fName;
  String lName;
  String email;
  String role;
  DateTime createdAt;

  RegistrationModel({required this.fName, required this.lName,
    required this.email, required this.role, required this.createdAt});

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      fName: map["fName"],
      lName: map["lName"],
      email: map["email"],
      role: map["role"],
      createdAt: map["createdAt"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "fName": fName,
      "lName": lName,
      "email": email,
      "role": role,
      "createdAt": createdAt,
    };
  }
}