class Message {
  final String? message;
  final String? id;

  Message({this.id, this.message});

  factory Message.fromJson(json) =>
      Message(message: json['message'], id: json['id']);
}
