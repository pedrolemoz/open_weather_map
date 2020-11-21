import 'package:mockito/mockito.dart';
import 'package:open_weather_map/core/config/api_key.dart';
import 'package:open_weather_map/core/http_client/http_client.dart';
import 'package:open_weather_map/features/open_weather_map/data/datasources/open_weather_map_remote_datasource.dart';
import 'package:test/test.dart';

import '../response_mock/api_response.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  MockHttpClient httpClient;
  OpenWeatherMapRemoteDatasource remoteDatasource;

  setUp(() {
    httpClient = MockHttpClient();
    remoteDatasource = OpenWeatherMapRemoteDatasourceImplementation(httpClient);
  });

  group('getWeatherInfoForCity', () {
    test('should call GET method from httpClient with correct URL', () async {
      // Arrange
      final tCity = 'Fortaleza';
      final endpoint =
          'http://api.openweathermap.org/data/2.5/weather?q=$tCity&units=metric&appid=$kAPIKey';

      when(httpClient.get(any)).thenAnswer(
        (_) async => HttpResponse(
          data: apiResponse,
          statusCode: 200,
        ),
      );

      // Act
      await remoteDatasource.getWeatherInfoForCity(tCity);

      // Assert
      verify(httpClient.get(endpoint));
    });
  });
}
