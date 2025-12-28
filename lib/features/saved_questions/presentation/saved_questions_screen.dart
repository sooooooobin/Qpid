import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../data/saved_questions_repository.dart';
import '../../question/data/question_data.dart';

class SavedQuestionsScreen extends HookWidget {
  const SavedQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedQuestions = useState<List<Question>>([]);
    final isLoading = useState(true);

    void loadQuestions() async {
      isLoading.value = true;
      final questions = await SavedQuestionsRepository.getSavedQuestions();
      savedQuestions.value = questions;
      isLoading.value = false;
    }

    void deleteQuestion(String questionText) async {
      await SavedQuestionsRepository.deleteQuestion(questionText);
      loadQuestions();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('질문이 삭제되었습니다'),
          duration: Duration(seconds: 1),
        ),
      );
    }

    void clearAll() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('모두 삭제'),
          content: const Text('저장된 모든 질문을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('삭제'),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        await SavedQuestionsRepository.clearAll();
        loadQuestions();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('모든 질문이 삭제되었습니다'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }

    useEffect(() {
      loadQuestions();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppTheme.creamBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('내 질문 저장'),
        actions: [
          if (savedQuestions.value.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: clearAll,
              tooltip: '모두 삭제',
            ),
        ],
      ),
      body: isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryCoral),
              ),
            )
          : savedQuestions.value.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 64,
                        color: AppTheme.textLight.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '저장된 질문이 없습니다',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.textLight,
                            ),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    loadQuestions();
                  },
                  color: AppTheme.primaryCoral,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: savedQuestions.value.length,
                    itemBuilder: (context, index) {
                      final question = savedQuestions.value[index];
                      final levelInfo = AppConstants.levels[question.level];
                      final levelColor = AppTheme.getLevelColor(question.level);

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: levelColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                levelInfo?.emoji ?? '💬',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          title: Text(
                            question.text,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: question.guide != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    question.guide!,
                                    style: TextStyle(
                                      color: AppTheme.textLight,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                )
                              : null,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => deleteQuestion(question.text),
                            color: AppTheme.textLight,
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

