import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Views/Chats.dart';
import 'package:untitled2/Views/Favourite_Screen.dart';
import 'package:untitled2/Views/Profile/Profile_screen.dart';
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  void updateIndex(int index) => emit(index);
  void Home() => emit(0);
  void Favourite() => emit(1);
  void Chats() => emit(2);
  void Profile() => emit(3);

}
