class ChurchModel {
  String name;
  String assignedAdminEmail;
  String accNumber;
  DateTime registeredAt;

  ChurchModel(
      {required this.name,
      required this.assignedAdminEmail,
      required this.accNumber,
      required this.registeredAt});

  factory ChurchModel.fromMap(Map<String, dynamic> map) {
    return ChurchModel(
      name: map["name"],
      assignedAdminEmail: map["assignedAdminEmail"],
      accNumber: map["accNumber"],
      registeredAt: map["registeredAt"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "assignedAdminEmail": assignedAdminEmail,
      "accNumber": accNumber,
      "registeredAt": registeredAt,
    };
  }
}
