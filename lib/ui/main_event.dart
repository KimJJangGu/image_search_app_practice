import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.freezed.dart';

@freezed
sealed class MainEvent with _$MainEvent {
  factory MainEvent.showSnackBar(String message) = ShowSnackBar;
  factory MainEvent.showDialog(String message) = ShowDialog;
}