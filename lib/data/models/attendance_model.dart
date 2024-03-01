class AttendanceData {
  List<StMonthlyAttendance>? stMonthlyAttendance;
  List<StYearlyAttendance>? stYearlyAttendance;

  AttendanceData({this.stMonthlyAttendance, this.stYearlyAttendance});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    if (json['stMonthlyAttendance'] != null) {
      stMonthlyAttendance = <StMonthlyAttendance>[];
      json['stMonthlyAttendance'].forEach((v) {
        stMonthlyAttendance!.add(StMonthlyAttendance.fromJson(v));
      });
    }
    if (json['stYearlyAttendance'] != null) {
      stYearlyAttendance = <StYearlyAttendance>[];
      json['stYearlyAttendance'].forEach((v) {
        stYearlyAttendance!.add(StYearlyAttendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stMonthlyAttendance != null) {
      data['stMonthlyAttendance'] =
          this.stMonthlyAttendance!.map((v) => v.toJson()).toList();
    }
    if (this.stYearlyAttendance != null) {
      data['stYearlyAttendance'] =
          this.stYearlyAttendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StMonthlyAttendance {
  String? schoolCode;
  String? admsnNo;
  String? attendanceDt;
  bool? present;
  bool? absent;
  bool? leave;
  bool? halfDay;
  String? userCode;

  StMonthlyAttendance(
      {this.schoolCode,
        this.admsnNo,
        this.attendanceDt,
        this.present,
        this.absent,
        this.leave,
        this.halfDay,
        this.userCode});

  static StMonthlyAttendance fromJson(Map<String, dynamic> json) {
    return StMonthlyAttendance(schoolCode : json['schoolCode'],
        admsnNo : json['admsnNo'],
        attendanceDt : json['attendanceDt'],
        present : json['present'],
        absent : json['absent'],
        leave : json['leave'],
        halfDay : json['halfDay'],
        userCode : json['userCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolCode'] = this.schoolCode;
    data['admsnNo'] = this.admsnNo;
    data['attendanceDt'] = this.attendanceDt;
    data['present'] = this.present;
    data['absent'] = this.absent;
    data['leave'] = this.leave;
    data['halfDay'] = this.halfDay;
    data['userCode'] = this.userCode;
    return data;
  }
}

class StYearlyAttendance {
  int month;
  int p;
  int a;
  int l;
  int h;
  int wd;

  StYearlyAttendance({required this.month, required this.p, required this.a, required this.l, required this.h,required this.wd});


  static StYearlyAttendance fromJson(Map<String, dynamic> json) {
    return  StYearlyAttendance(month: json['month'], p: json['p'], a: json['a'], l: json['l'], h: json['h'],wd: json['wd']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['p'] = this.p;
    data['a'] = this.a;
    data['l'] = this.l;
    data['h'] = this.h;
    data['wd'] = this.wd;
    return data;
  }
}
