part of 'training_cubit.dart';

class TrainingState {
  final List<ItemModel> documents;
  final bool isLoading;
  final String errorMessage;

  const TrainingState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
