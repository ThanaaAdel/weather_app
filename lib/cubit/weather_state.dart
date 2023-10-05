part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess(this.weatherModel);

}
class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure(this.errorMessage);
}


