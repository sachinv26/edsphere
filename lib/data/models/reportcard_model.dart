class ReportCard {
  String schoolCode;
  String examName;
  String examClassName;
  int examMM;
  int examScalingPercentage;
  bool isOnlyGrade;

  ReportCard({
    required this.schoolCode,
    required this.examName,
    required this.examClassName,
    required this.examMM,
    required this.examScalingPercentage,
    required this.isOnlyGrade,
  });

  static ReportCard fromJson(Map<String, dynamic> json) {
    return ReportCard(
      schoolCode: json['schoolCode'],
      examName: json['examName'],
      examClassName: json['examClassName'],
      examMM: json['examMM'],
      examScalingPercentage: json['examScalingPercentage'],
      isOnlyGrade: json['isOnlyGrade'],
    );
  }
}

// class MarksResponse {
//   final List<MarksDetail> marksDetail;
//   final MarksNote note;
//
//   MarksResponse({
//     required this.marksDetail,
//     required this.note,
//   });
//
//   factory MarksResponse.fromJson(Map<String, dynamic> json) {
//     return MarksResponse(
//       marksDetail: List<MarksDetail>.from(
//           json['marksDetail'].map((detail) => MarksDetail.fromJson(detail))),
//       note: MarksNote.fromJson(json['note']),
//     );
//   }
// }

class MarksDetail {
  final String subjectName;
  final int marks;
  final String grade;

  MarksDetail({
    required this.subjectName,
    required this.marks,
    required this.grade,
  });

  static MarksDetail fromJson(Map<String, dynamic> json) {
    return MarksDetail(
      subjectName: json['subjectName'],
      marks: json['marks'],
      grade: json['grade'],
    );
  }
}

class Note {
  final String note1;
  final String note2;
  final String note3;

  Note({
    required this.note1,
    required this.note2,
    required this.note3,
  });

  static Note fromJson(Map<String, dynamic> json) {
    return Note(
      note1: json['note1'],
      note2: json['note2'],
      note3: json['note3'],
    );
  }
}
