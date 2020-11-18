import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/weather_information.dart';
import '../../domain/repositories/open_weather_map_repository.dart';
import '../datasources/open_weather_map_remote_datasource.dart';

class OpenWeatherMapRepositoryImplementation extends OpenWeatherMapRepository {
  final OpenWeatherMapRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  OpenWeatherMapRepositoryImplementation({
    @required this.remoteDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherInformation>> getWeatherInfoForCity(
      String cityName) async {
    networkInfo.hasActiveNetwork;
    return right(await remoteDatasource.getWeatherInfoForCity(cityName));
  }
}
