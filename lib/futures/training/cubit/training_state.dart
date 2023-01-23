part of 'training_cubit.dart';

@immutable
class TrainingState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const TrainingState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
