class QuestionModel {

  const QuestionModel(this.question, this.options);

  final String question;
  final List<String> options;

  List<String> shuffledList() {
    final newList = List.of(options);
    newList.shuffle();
    return newList;
  }

}