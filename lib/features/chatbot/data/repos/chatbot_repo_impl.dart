import '../../domain/entities/suggested_question_entity.dart';
import '../../domain/repos/chatbot_repo.dart';
import '../datasources/chatbot_data_source.dart';

class ChatbotRepoImpl implements ChatbotRepo {
  final ChatbotDataSource dataSource;

  const ChatbotRepoImpl(this.dataSource);

  @override
  Future<List<SuggestedQuestionEntity>> getSuggestedQuestions() {
    return dataSource.getSuggestedQuestions();
  }

  @override
  Future<String> getAnswer(int questionId) {
    return dataSource.getAnswer(questionId);
  }
}