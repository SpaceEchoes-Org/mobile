import '../models/suggested_question_model.dart';

abstract class ChatbotDataSource {
  Future<List<SuggestedQuestionModel>> getSuggestedQuestions();
  Future<String> getAnswer(int questionId);
}