import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:open_weather_map/core/usecases/usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/weather_information.dart';
import '../repositories/open_weather_map_repository.dart';

class GetWeatherInfoForCity implements Usecase<WeatherInformation, Params> {
  final OpenWeatherMapRepository repository;

  GetWeatherInfoForCity(this.repository);

  Future<Either<Failure, WeatherInformation>> call(Params params) async {
    return await repository.getWeatherInfoForCity(params.cityName);
  }
}

class Params extends Equatable {
  final String cityName;
  Params({@required this.cityName});

  List<Object> get props => [cityName];
}
