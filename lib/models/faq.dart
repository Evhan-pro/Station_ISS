class FAQ {
  String question;
  String answer;
  bool isExpanded;

  FAQ({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}
