class Event {
  String fromDt;
  String toDt;
  String msg;
  String pdfAttachement;

  Event({
    required this.fromDt,
    required this.toDt,
    required this.msg,
    required this.pdfAttachement,
  });

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      fromDt: json['fromDt'],
      toDt: json['toDt'],
      msg: json['msg'],
      pdfAttachement: json['pdfAttachement'], // Note: Corrected the key to match JSON data
    );
  }
}
