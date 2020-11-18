import 'package:open_weather_map/features/open_weather_map/data/models/weather_info_model.dart';

abstract class LocalDatasource {
  Future<WeatherInfoModel> getLastCachedWeatherInfo(String cityName);

  Future<void> cacheWeatherInfo(WeatherInfoModel weatherInfo);
}
