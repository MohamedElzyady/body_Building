import 'package:body_buliding/features/exercises/data/weight_repository.dart';
import 'package:body_buliding/features/exercises/view_model/cubit/weight_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit that manages last-weight tracking for exercises.
/// Weights are persisted locally via [WeightRepository].
class WeightCubit extends Cubit<WeightState> {
  final WeightRepository _repository;

  WeightCubit(this._repository) : super(WeightState.initial());

  /// Loads all persisted weights from local storage on startup.
  Future<void> loadWeights() async {
    final weights = await _repository.loadAll();
    emit(WeightState(weights: Map.unmodifiable(weights)));
  }

  /// Updates and persists the weight for a given exercise.
  Future<void> setWeight(String exerciseName, double weight) async {
    await _repository.saveWeight(exerciseName, weight);
    emit(state.copyWithWeight(exerciseName, weight));
  }
}
