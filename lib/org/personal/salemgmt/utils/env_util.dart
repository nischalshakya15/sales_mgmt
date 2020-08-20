import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, String> env;

Future<void> loadEnvFile(String path) async {
  DotEnv instance = DotEnv();
  await instance.load(path);
  env = instance.env;
}
