class MessageModel {
  String firstName;
  String lastName;
  String email;
  String position;
  DateTime createdAt;

  MessageModel({required this.firstName, required this.lastName,
    required this.email, required this.position, required this.createdAt});

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      firstName: map["firstName"],
      lastName: map["lastName"],
      email: map["email"],
      position: map["position"],
      createdAt: map["createdAt"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "position": position,
      "createdAt": createdAt,
    };
  }
}