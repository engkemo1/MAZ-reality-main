class Message {
  String? sId;
  String? text;
  String? userId;
  String? chatId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Message(
      {this.sId,
        this.text,
        this.userId,
        this.chatId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    userId = json['userId'];
    chatId = json['chatId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['text'] = this.text;
    data['userId'] = this.userId;
    data['chatId'] = this.chatId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
