
class NotificationModel {
  final int id;
  final String title;
  final String msg;
  final String attachement;
  final String entryDate;
  bool readed;

  NotificationModel({
    required this.id,
    required this.title,
    required this.msg,
    required this.attachement,
    required this.entryDate,
    required this.readed,
  });

  static NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      msg: json['msg'],
      attachement: json['attachement'],
      entryDate: json['entryDate'],
      readed: json['readed'],
    );
  }
}
