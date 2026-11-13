import '../repos/chatbot_repo.dart';

class GetAnswerUseCase {
  final ChatbotRepo repo;

  const GetAnswerUseCase(this.repo);

  Future<String> call(int questionId) => repo.getAnswer(questionId);
}