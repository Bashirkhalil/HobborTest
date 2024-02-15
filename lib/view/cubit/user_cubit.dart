import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_functionality/controller/user_controller.dart';

import 'user_state.dart';

class NewsCubit extends Cubit<NewsState> {

  NewController mNewController;

  NewsCubit({required this.mNewController}) : super(NewsInitial());

  void getNewsApi() {

  }

}
