import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_project/models/item__model.dart';

part 'training_state.dart';

class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit()
      : super(
          const TrainingState(
            documents: [],
            errorMessage: '',
            isLoading: true,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('categories')
        .snapshots()
        .listen((data) {
      final itemModels = data.docs.map((doc) {
        return ItemModel(
          document: data.docs,
        );
      }).toList();
      emit(
        TrainingState(
          documents: itemModels,
          isLoading: true,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          TrainingState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }
}
