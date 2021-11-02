import 'package:flutter_bloc/flutter_bloc.dart';


class TextInputCubit extends Cubit<String>{
  TextInputCubit() : super('');

  void capitalise(text){
    emit(text.toUpperCase());
    print(state);
  }
}