class ChatsModel {
  List<String>? usersIDs;
  List<String>? seenBy;
  String? sId;
  String? createdAt;
  String? lastMessage;
  String? id;
  Receiver? receiver;

  ChatsModel(
      {this.usersIDs,
        this.seenBy,
        this.sId,
        this.createdAt,
        this.lastMessage,
        this.id,
        this.receiver});

  ChatsModel.fromJson(Map<String, dynamic> json) {
    usersIDs = json['usersIDs'].cast<String>();
    seenBy = json['seenBy'].cast<String>();
    sId = json['_id'];
    createdAt = json['createdAt'];
    lastMessage = json['lastMessage'];
    id = json['id'];
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usersIDs'] = this.usersIDs;
    data['seenBy'] = this.seenBy;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['lastMessage'] = this.lastMessage;
    data['id'] = this.id;
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    return data;
  }
}

class Receiver {
  String? photo;
  String? sId;
  String? name;

  Receiver({this.photo, this.sId, this.name});

  Receiver.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
