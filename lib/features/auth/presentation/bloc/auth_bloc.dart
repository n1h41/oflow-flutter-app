import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflow/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.initial());
}
