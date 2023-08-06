import 'package:flutter_bloc/flutter_bloc.dart';

import 'brightness_states.dart';

class BrightnessCubit extends Cubit<BrightnessStates>
{
  BrightnessCubit() : super(InitialState());

}