class MarksResponse {
  final List<MarksDetail> marksDetail;
  final MarksNote note;

  MarksResponse({
    required this.marksDetail,
    required this.note,
  });

  factory MarksResponse.fromJson(Map<String, dynamic> json) {
    return MarksResponse(
      marksDetail: List<MarksDetail>.from(json['marksDetail'].map((detail) => MarksDetail.fromJson(detail))),
      note: MarksNote.fromJson(json['note']),
    );
  }
}

class MarksDetail {
  final String subjectName;
  final int marks;
  final String grade;

  MarksDetail({
    required this.subjectName,
    required this.marks,
    required this.grade,
  });

  factory MarksDetail.fromJson(Map<String, dynamic> json) {
    return MarksDetail(
      subjectName: json['subjectName'],
      marks: json['marks'],
      grade: json['grade'],
    );
  }
}

class MarksNote {
  final String? note1;
  final String? note2;
  final String note3;
  final String note4;
  final String note5;

  MarksNote({
    required this.note1,
    required this.note2,
    required this.note3,
    required this.note4,
    required this.note5,
  });

  factory MarksNote.fromJson(Map<String, dynamic> json) {
    return MarksNote(
      note1: json['note1'],
      note2: json['note2'],
      note3: json['note3'],
      note4: json['note4'],
      note5: json['note5'],
    );
  }
}
