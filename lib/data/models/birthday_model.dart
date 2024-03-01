class Birthday {
  String admsnNo;
  String stClass;
  String section;
  String srNo;
  String rollNo;
  String firstName;
  String? fName;
  String? mName;
  String? mobile;
  String photo;

  Birthday({
    required this.admsnNo,
    required this.stClass,
    required this.section,
    required this.srNo,
    required this.rollNo,
    required this.firstName,
    this.fName,
    this.mName,
    this.mobile,
    required this.photo,
  });

  static Birthday fromJson(Map<String, dynamic> json) {
    return Birthday(
      admsnNo: json['admsnNo']??"",
      stClass: json['stClass']??"",
      section: json['section']??"",
      srNo: json['srNo'] ?? "", // Handle the case where srNo might be null
      rollNo: json['rollNo']?? "",
      firstName: json['firstName']?? "",
      fName: json['fName']?? "",
      mName: json['mName']??"",
      mobile: json['mobile']??"",
      photo: json['photo']??"",
    );
  }
}
