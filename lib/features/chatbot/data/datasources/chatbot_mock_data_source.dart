import '../models/suggested_question_model.dart';
import 'chatbot_data_source.dart';

class ChatbotMockDataSource implements ChatbotDataSource {
  static const List<Map<String, dynamic>> _mockData = [
    {
      'id': 1,
      'question': 'Tell me more about Mars.',
      'answer':
      'Mars is the Red Planet: cold, dusty, and home to Olympus Mons, the tallest volcano in the solar system. Robots like Sojourner, Spirit and Opportunity explored it to look for signs of ancient water.',
    },
    {
      'id': 2,
      'question': 'What happened to this rover?',
      'answer':
      'Many rovers go silent after years of work. Opportunity, for example, lost contact in 2018 after a huge dust storm blocked the sunlight its solar panels needed.',
    },
    {
      'id': 3,
      'question': 'How do space rovers work?',
      'answer':
      'Rovers are robots on wheels. They get power from solar panels or special batteries, use cameras and tools to study rocks, and send their findings to scientists on Earth by radio.',
    },
    {
      'id': 4,
      'question': 'Explain this mission in simple words.',
      'answer':
      'We sent a robot explorer to another world to take pictures, test the soil, and help us find out if life could ever have existed there.',
    },
  ];

  @override
  Future<List<SuggestedQuestionModel>> getSuggestedQuestions() async {
    return _mockData.map((e) => SuggestedQuestionModel.fromJson(e)).toList();
  }

  @override
  Future<String> getAnswer(int questionId) async {

    await Future.delayed(const Duration(milliseconds: 700));
    final item = _mockData.firstWhere(
          (e) => e['id'] == questionId,
      orElse: () => const {'answer': 'Hmm, I do not know that one yet!'},
    );
    return item['answer'] as String;
  }
}