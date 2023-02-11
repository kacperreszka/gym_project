import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_project/models/item__model.dart';

import 'cubit/training_cubit.dart';

class TrainingPageContent extends StatefulWidget {
  const TrainingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingPageContent> createState() => _TrainingPageContentState();
}

class _TrainingPageContentState extends State<TrainingPageContent> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingCubit()..start(),
      child: BlocBuilder<TrainingCubit, TrainingState>(
        builder: (context, state) {
          final itemModels = state.documents;
          if (itemModels.isNotEmpty) {
            return Text('Coś poszło nie tak ${state.errorMessage}');
          }
          if (state.isLoading) {
            return const CircularProgressIndicator();
          }

          return BlocProvider(
            create: (context) => TrainingCubit()..start(),
            child: ListView(
              children: [
                for (final itemModel in itemModels) ...[
                  Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Dismissible(
                        key: ValueKey(itemModel),
                        onDismissed: (_) {
                          FirebaseFirestore.instance
                              .collection('categories')
                              .doc('name')
                              .delete();
                        },
                        child: _ListViewItem(
                          itemModel: itemModel,
                        ),
                      ),
                    );
                  }),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({super.key, required this.itemModel});

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            itemModel.document.toString(),
          )
        ],
      ),
    );
  }
}
