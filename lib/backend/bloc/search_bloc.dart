import 'package:flutter_bloc/flutter_bloc.dart';

abstract class VolunteerEvent {}
class VolunteerCheckedEvent extends VolunteerEvent {}
class VolunteerUncheckedEvent extends VolunteerEvent {}

class VolunteerBloc extends Bloc<VolunteerEvent, bool> {
  VolunteerBloc() : super(false) {
    on<VolunteerCheckedEvent>((event, emit) => emit(true));
    on<VolunteerUncheckedEvent>((event, emit) => emit(false));
  }
}