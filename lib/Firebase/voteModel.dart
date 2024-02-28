class VoteModel {
  String title;
  String amount;
  String accNumber;
  String deficit;
  DateTime timeSent;

  VoteModel({required this.title, required this.amount,
    required this.accNumber, required this.deficit, required this.timeSent});

  factory VoteModel.fromMap(Map<String, dynamic> map) {
    return VoteModel(
      title: map["title"],
      amount: map["amount"],
      timeSent: map["timeSent"],
      accNumber: map["accNumber"],
      deficit: map['deficit'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "amount": amount,
      "accNumber": accNumber,
      "timeSent": timeSent,
      "deficit": deficit,
    };
  }
}