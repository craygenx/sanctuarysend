class MessageModel {
  String title;
  String description;
  DateTime timeSent;

  MessageModel({required this.title, required this.description,
    required this.timeSent});

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      title: map["title"],
      description: map["description"],
      timeSent: map["timeSent"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "description": description,
      "timeSent": timeSent,
    };
  }
}