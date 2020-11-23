import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controllers/app_controller.dart';

class WeatherInformationWidget extends StatelessWidget {
  const WeatherInformationWidget({
    Key key,
    @required AppController appController,
  })  : _appController = appController,
        super(key: key);

  final AppController _appController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Text(
              '${_appController.city} - ${_appController.country}',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(height: 15.0),
            Text(
              '${_appController.currentTemperature.toInt()}ºC',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(height: 15.0),
            Text(
              _appController.weatherDescription,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey[800]),
            ),
          ],
        );
      },
    );
  }
}
