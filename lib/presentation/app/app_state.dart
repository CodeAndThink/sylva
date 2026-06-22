part of 'app_cubit.dart';

class AppState extends Equatable {
  final bool isFirstTime;

  const AppState({this.isFirstTime = true});

  @override
  List<Object?> get props => [isFirstTime];

  AppState copyWith({bool? isFirstTime}) {
    return AppState(isFirstTime: isFirstTime ?? this.isFirstTime);
  }
}
