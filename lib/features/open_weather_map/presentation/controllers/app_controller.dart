import 'package:mobx/mobx.dart';
import 'package:open_weather_map/features/open_weather_map/domain/usecases/get_weather_info_for_city.dart';

import '../../../../core/util/extensions.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final GetWeatherInfoForCity _usecase;

  _AppControllerBase(GetWeatherInfoForCity usecase) : _usecase = usecase;

  @observable
  double currentTemperature;

  @observable
  String city;

  @observable
  String country;

  @observable
  String weatherDescription;

  @computed
  bool get hasData =>
      currentTemperature != null &&
      city != null &&
      country != null &&
      weatherDescription != null;

  @action
  Future<void> getWeatherInfoForCity(String cityName) async {
    final result = await _usecase(Params(cityName: cityName));

    result.fold((l) => null, (r) {
      country = r.country;
      city = r.cityName;
      currentTemperature = r.currentTemperature;
      weatherDescription = r.weatherDescription;

      print(city);
    });
  }
}