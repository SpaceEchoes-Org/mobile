import '../entities/suggested_question_entity.dart';
import '../repos/chatbot_repo.dart';

class GetSuggestedQuestionsUseCase {
  final ChatbotRepo repo;

  const GetSuggestedQuestionsUseCase(this.repo);

  Future<List<SuggestedQuestionEntity>> call() => repo.getSuggestedQuestions();
}