class ClassroomContext {
  const ClassroomContext({
    required this.courseName,
    this.courseDetails,
    this.courseWorkTitle,
    this.courseWorkStatus,
    this.announcementText,
    this.errorMessage,
  });

  final String courseName;
  final String? courseDetails;
  final String? courseWorkTitle;
  final String? courseWorkStatus;
  final String? announcementText;
  final String? errorMessage;
}
