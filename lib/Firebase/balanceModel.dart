class BalanceModel {
  String prevBalance;
  String newBalance;
  DateTime lastModified;

  BalanceModel({required this.prevBalance, required this.newBalance, required this.lastModified});

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      prevBalance: map["prevBalance"],
      newBalance: map["newBalance"],
      lastModified: map["lastModified"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "prevBalance": prevBalance,
      "newBalance": newBalance,
      "lastModified": lastModified,
    };
  }
}