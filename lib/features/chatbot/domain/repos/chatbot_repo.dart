import '../entities/suggested_question_entity.dart';

abstract class ChatbotRepo {
  Future<List<SuggestedQuestionEntity>> getSuggestedQuestions();
  Future<String> getAnswer(int questionId);
}