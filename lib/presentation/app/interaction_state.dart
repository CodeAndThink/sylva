import 'package:equatable/equatable.dart';

class InteractionState extends Equatable {
  final bool hapticEnabled;
  final bool soundEnabled;

  const InteractionState({this.hapticEnabled = true, this.soundEnabled = true});

  InteractionState copyWith({bool? hapticEnabled, bool? soundEnabled}) {
    return InteractionState(
      hapticEnabled: hapticEnabled ?? this.hapticEnabled,
      soundEnabled: soundEnabled ?? this.soundEnabled,
    );
  }

  @override
  List<Object?> get props => [hapticEnabled, soundEnabled];
}
