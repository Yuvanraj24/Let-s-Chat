class ChatListModel {
  String name;
  String lastMessage;
  String imageURL;
  String time;
  String userId;
  ChatListModel({
    required this.name,
    required this.lastMessage,
    required this.imageURL,
    required this.time ,
    required this.userId,
  });
}

class ChatMessageModel{
  String messageContent;
  String messageType;
  String msgId;
  String msgTime;

  String userType;
  ChatMessageModel({
    required this.messageContent,
    required this.messageType,
    required this.msgId,
    required this.msgTime,
    required this.userType});
}

class UserModel{
  String userName;
  String userMail;
  String userId;

  UserModel({required this.userName, required this.userMail, required this.userId});
}