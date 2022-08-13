import 'package:injectable/injectable.dart';

import 'raw_config.dart';

@singleton
class AppConfig {
  final RawConfig _config;

  AppConfig(this._config);

  String get apiUrl => _config['API_URL']!;
}
