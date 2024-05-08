class ChatListModel {
  String name;
  String lastMessage;
  String imageURL;
  String time;
  ChatListModel({required this.name, required this.lastMessage, required this.imageURL, required this.time});
}

class ChatMessageModel{
  String messageContent;
  String messageType;
  String userType;
  ChatMessageModel({required this.messageContent, required this.messageType, required this.userType});
}