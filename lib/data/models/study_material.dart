class StudyMaterialClass {
  final String topicName;
  final String category;
  final String materialLink;

  StudyMaterialClass({
    required this.topicName,
    required this.category,
    required this.materialLink,
  });

  static StudyMaterialClass fromJson(Map<String, dynamic> json) {
    return StudyMaterialClass(
      topicName: json['topicName'],
      category: json['category'],
      materialLink: json['materialLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topicName': topicName,
      'category': category,
      'materialLink': materialLink,
    };
  }
}
