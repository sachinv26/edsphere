class OtherFeeDetails {
  String? name;
  dynamic? father;
  String? enrolmentNo;
  String? className;
  double? dueAmount;
  int? errorCode;
  bool? amtEditable;
  String itemId;
  String? trpName;

  OtherFeeDetails({
    required this.name,
    required this.father,
    required this.enrolmentNo,
    required this.className,
    required this.dueAmount,
    required this.errorCode,
    required this.amtEditable,
    required this.itemId,
    required this.trpName,
  });

  static OtherFeeDetails fromJson(Map<String, dynamic> json) {
    return OtherFeeDetails(
      name:json['name'],
      father:json['father'],
      enrolmentNo:json['enrolment_no'],
      className:json['class'],
      dueAmount:json['due_amount'],
      errorCode:json['errorcode'],
      amtEditable:json['amt_editable'],
      itemId:json['item_id'],
      trpName:json['trpName']);
    }
}

class FeeDetail {
  final String feeHead;
  final int amount;
  bool isPaid;
  final bool mandatory;
  bool? ischeck=false;
  FeeDetail(
      {required this.feeHead,
      required this.amount,
      required this.isPaid,
      required this.mandatory,});

  static FeeDetail fromJson(Map<String, dynamic> json) {
    return FeeDetail(
        feeHead: json['fee_Head'],
        amount: json['amount'],
        isPaid: json['is_paid'],
        mandatory: json['mandatory']);
  }
}
