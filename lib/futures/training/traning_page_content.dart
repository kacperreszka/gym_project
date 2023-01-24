import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_project/futures/training/cubit/training_cubit.dart';

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
          if (state.errorMessage.isNotEmpty) {
            return Text('Coś poszło nie tak ${state.errorMessage}');
          }
          if (state.isLoading) {
            return const Text('Trwa ładowanie danych');
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Text(document['name']),
              ],
              CheckboxListTile(
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Siema'),
                subtitle: const Text('Co dziś robię?'),
                value: isChecked,
                onChanged: ((value) {
                  setState(() => isChecked = value!);
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
