class DataCategoriesModel {
  String? id;
  String? CourseName;
  String? SubjectArea;
  String? SkillLevel;
  String? TrainingProgram;
  String? CertificationType;
  String? ImageURL;
  String? Content;
  String? Duration;
  String? Price;
  String? VideoURL;

  DataCategoriesModel(
      {required this.id,
      required this.CourseName,
      required this.SubjectArea,
      required this.SkillLevel,
      required this.TrainingProgram,
      required this.CertificationType,
      required this.ImageURL,
      required this.Content,
      required this.Price,
      required this.Duration,
      required this.VideoURL});
  DataCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    CourseName = json['CourseName'];
    SubjectArea = json['SubjectArea'];
    SkillLevel = json['SkillLevel'];
    TrainingProgram = json['TrainingProgram'];
    CertificationType = json['CertificationType'];
    ImageURL = json['ImageURL'];
    Content = json['Content'];
    Duration = json['Duration'];
    Price = json['Price'];
    VideoURL = json['VideoURL'];
  }
}
