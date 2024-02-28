class PaymentModel {
  String sender;
  double amount;
  String mode;
  String category;
  DateTime timeSent;

  PaymentModel({required this.sender, required this.amount,
    required this.mode, required this.category, required this.timeSent});

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      sender: map["sender"],
      amount: map["amount"],
      timeSent: map["timeSent"],
      category: map["category"],
      mode: map["mode"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "sender": sender,
      "amount": amount,
      "mode": mode,
      "category": category,
      "timeSent": timeSent,
    };
  }
}