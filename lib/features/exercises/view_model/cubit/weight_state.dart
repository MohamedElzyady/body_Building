/// State for [WeightCubit].
/// Holds an immutable map of exerciseName → last weight (kg).
class WeightState {
  final Map<String, double> weights;

  const WeightState({required this.weights});

  factory WeightState.initial() => const WeightState(weights: {});

  /// Returns the stored weight for [exerciseName], or null if not yet set.
  double? weightFor(String exerciseName) => weights[exerciseName];

  WeightState copyWithWeight(String exerciseName, double weight) {
    return WeightState(
      weights: Map.unmodifiable({...weights, exerciseName: weight}),
    );
  }
}
