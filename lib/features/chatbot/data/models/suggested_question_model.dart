import '../../domain/entities/suggested_question_entity.dart';

class SuggestedQuestionModel extends SuggestedQuestionEntity {
  const SuggestedQuestionModel({required super.id, required super.text});

  factory SuggestedQuestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestedQuestionModel(
      id: json['id'] as int,
      text: json['question'] as String,
    );
  }
}