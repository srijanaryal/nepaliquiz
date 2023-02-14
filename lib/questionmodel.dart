class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];
  list.add(
    Question(
      "नेपाल सरकारले जनताका गुनासा सुन्न सुरु गरेको हेलो सरकार  को निशुल्क फोन नं कति हो ?",
      [
        Answer("1111", true),
        Answer("1411", false),
        Answer("1511", false),
        Answer("1211", false),
      ],
    ),
  );
  list.add(
    Question(
      "अदुवा उत्पादनमा नेपाल बिश्वोको कुन स्थानमा पर्छ ??",
      [
        Answer("1", false),
        Answer("2", false),
        Answer("4", true),
        Answer("3", false),
      ],
    ),
  );
  list.add(
    Question(
      "चेस खेलको सुरु कुन देशबाट भएको हो ? ?",
      [
        Answer("Nepal", false),
        Answer("India", true),
        Answer("China", false),
        Answer("UK", false),
      ],
    ),
  );
  list.add(
    Question(
      "एसिया को कुल क्षेत्रफलको कति प्रतिशत भूभाग नेपालले ओगटेको छ? ?",
      [
        Answer("1.5", false),
        Answer("1.9", false),
        Answer("1.58", false),
        Answer("0.3", true),
      ],
    ),
  );
  list.add(
    Question(
      "नेपालको समय प्रमाणिक समय ग्रीनवीच भन्दा कति घण्टा कति मिनेट छिटो छ?",
      [
        Answer("5 hrs 40 min", false),
        Answer("5 hrs 30 min", false),
        Answer("5 hrs 45 min", true),
        Answer("4 hrs 55 min", false),
      ],
    ),
  );

  list.add(
    Question(
      "क्षेत्रफलको हिसाबले तेस्रो ठूलो महादेश कुन हो ?",
      [
        Answer("Asia", false),
        Answer("Africa", false),
        Answer("North America", true),
        Answer("Europe", false),
      ],
    ),
  );
  list.add(
    Question(
      "एसिया को कुल क्षेत्रफलको कति प्रतिशत भूभाग नेपालले ओगटेको छ? ?",
      [
        Answer("1.5", false),
        Answer("1.9", false),
        Answer("1.58", false),
        Answer("0.3", true),
      ],
    ),
  );

  list.add(
    Question(
      "संयुक्त राष्ट्र संघ (UNO) को स्थापना कहिले भयो ?",
      [
        Answer("1945", false),
        Answer("1945", true),
        Answer("1947", false),
        Answer("1945", false),
      ],
    ),
  );
  // add question answer here
  return list;
}
