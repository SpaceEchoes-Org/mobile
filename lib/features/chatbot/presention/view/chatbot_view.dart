import 'package:flutter/material.dart';
import '../../data/datasources/chatbot_mock_data_source.dart';
import '../../data/repos/chatbot_repo_impl.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/entities/suggested_question_entity.dart';
import '../../domain/repos/chatbot_repo.dart';
import '../../domain/usecases/get_answer_usecase.dart';
import '../../domain/usecases/get_suggested_questions_usecase.dart';
import '../widget/chat_bubble.dart';
import '../widget/chat_header.dart';
import '../widget/chat_input_bar.dart';
import '../widget/suggestion_chips.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  // Mock data now. Later swap ChatbotMockDataSource with an API data source.
  late final ChatbotRepo _repo = ChatbotRepoImpl(ChatbotMockDataSource());
  late final GetSuggestedQuestionsUseCase _getQuestions =
  GetSuggestedQuestionsUseCase(_repo);
  late final GetAnswerUseCase _getAnswer = GetAnswerUseCase(_repo);

  final ScrollController _scrollController = ScrollController();

  final List<ChatMessageEntity> _messages = [
    const ChatMessageEntity(
      text: "Hey Explorer! I'm FLASH. Ready to discover something amazing?",
      isUser: false,
    ),
  ];
  List<SuggestedQuestionEntity> _questions = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadQuestions() async {
    final result = await _getQuestions();
    if (!mounted) return;
    setState(() => _questions = result);
  }

  Future<void> _onQuestionTap(SuggestedQuestionEntity question) async {
    if (_isTyping) return;

    setState(() {
      _messages.add(ChatMessageEntity(text: question.text, isUser: true));
      _questions = _questions.where((q) => q.id != question.id).toList();
      _isTyping = true;
    });
    _scrollToBottom();

    final answer = await _getAnswer(question.id);
    if (!mounted) return;

    setState(() {
      _messages.add(ChatMessageEntity(text: answer, isUser: false));
      _isTyping = false;
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E2858), Color(0xFF1C1838)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              children: [
                const ChatHeader(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (final m in _messages) ChatBubble(message: m),
                      if (_isTyping)
                        const ChatBubble(
                          message: ChatMessageEntity(text: '...', isUser: false),
                        ),
                      if (!_isTyping && _questions.isNotEmpty)
                        SuggestionChips(
                          questions: _questions,
                          onTap: _onQuestionTap,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const ChatInputBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}