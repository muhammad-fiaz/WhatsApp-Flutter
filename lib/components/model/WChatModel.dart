
import 'WUserModel.dart';

class ChatModel {
  final User? sender;
  final String? text;
  final String? time;
  final String? avatarUrl;
  final String? date;
  final bool? video;
  final bool? call;
  final bool? callRecived;
  final bool? callConnect;
  final bool? unread;

  ChatModel({this.sender, this.text, this.time, this.avatarUrl, this.date, this.video, this.call, this.callRecived, this.callConnect, this.unread});
}

// you - current user
final User currentUser = User(id: 0, name: 'Current User', avatarUrl: 'https://randomuser.me/api/portraits/men/86.jpg');

// USERS
final User michael = User(id: 1, name: 'Michael', avatarUrl: 'https://randomuser.me/api/portraits/men/96.jpg', isHide: false, isAddToGroup: false);
final User emily = User(id: 2, name: 'Emily', avatarUrl: 'https://randomuser.me/api/portraits/men/95.jpg', isHide: false, isAddToGroup: false);
final User daniel = User(id: 3, name: 'Daniel', avatarUrl: 'https://randomuser.me/api/portraits/women/55.jpg', isHide: false, isAddToGroup: false);
final User isabella = User(id: 4, name: 'Isabella', avatarUrl: 'https://randomuser.me/api/portraits/women/95.jpg', isHide: false, isAddToGroup: false);
final User jacob = User(id: 5, name: 'Jacob', avatarUrl: 'https://randomuser.me/api/portraits/women/86.jpg', isHide: false, isAddToGroup: false);
final User lily = User(id: 6, name: 'Lily', avatarUrl: 'https://randomuser.me/api/portraits/women/65.jpg', isHide: false, isAddToGroup: false);
final User matthew = User(id: 7, name: 'Matthew', avatarUrl: 'https://randomuser.me/api/portraits/men/98.jpg', isHide: false, isAddToGroup: false);

List<User> fav = [michael, emily, daniel, isabella, jacob, lily, matthew];

/* for payment method data */
class PaymentBank {
  final String? bankImage;
  final String? bankName;

  PaymentBank({this.bankImage, this.bankName});
}

class PaymentBankData {
  final PaymentBank? payBank;
  final String? nameofBank;

  PaymentBankData({this.nameofBank, this.payBank});
}
