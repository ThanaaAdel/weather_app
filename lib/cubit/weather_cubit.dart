import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';

import '../services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  final WeatherService weatherService;
  WeatherModel? weatherModel;
  void getWeather ({required String cityName}) async{
    emit(WeatherInitial());
    try {
      weatherModel =  await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel!));
    } on Exception catch (e) {
    emit(WeatherFailure('error'));
    }
  }
}
