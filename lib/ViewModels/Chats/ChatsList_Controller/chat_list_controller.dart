import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';

class ChatsListController extends GetxController {
  RxList<ChatListModel> chatUsers = RxList([
    ChatListModel(name: 'Ashwin Vijay', lastMessage: 'lastMessage', imageURL: 'https://img.etimg.com/thumb/msid-107732661,width-300,height-225,imgsize-38950,resizemode-75/spider-man-4-check-out-latest-updates-on-release-date-cast-plot-production-and-more.jpg', time: '10.25 am'),
    ChatListModel(name: 'Kalaiarasan', lastMessage: 'lastMessage', imageURL: 'https://img.etimg.com/thumb/msid-107732661,width-300,height-225,imgsize-38950,resizemode-75/spider-man-4-check-out-latest-updates-on-release-date-cast-plot-production-and-more.jpg', time: '10.30 am'),
    ChatListModel(name: 'Karthi', lastMessage: 'lastMessage', imageURL: 'https://img.etimg.com/thumb/msid-107732661,width-300,height-225,imgsize-38950,resizemode-75/spider-man-4-check-out-latest-updates-on-release-date-cast-plot-production-and-more.jpg', time: '10.40 am'),
    ChatListModel(name: 'Naveen', lastMessage: 'lastMessage', imageURL: 'https://img.etimg.com/thumb/msid-107732661,width-300,height-225,imgsize-38950,resizemode-75/spider-man-4-check-out-latest-updates-on-release-date-cast-plot-production-and-more.jpg', time: '10.40 am'),
    ChatListModel(name: 'Jaga', lastMessage: 'lastMessage', imageURL: 'https://img.etimg.com/thumb/msid-107732661,width-300,height-225,imgsize-38950,resizemode-75/spider-man-4-check-out-latest-updates-on-release-date-cast-plot-production-and-more.jpg', time: '10.40 am'),
    ChatListModel(name: 'Ruban', lastMessage: 'lastMessage', imageURL: 'https://img.etimg.com/thumb/msid-107732661,width-300,height-225,imgsize-38950,resizemode-75/spider-man-4-check-out-latest-updates-on-release-date-cast-plot-production-and-more.jpg', time: '10.40 am'),
  ]);
}