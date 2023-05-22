import 'package:fitnessfourthausend/bootstrap.dart';
import 'package:flutter/widgets.dart';
import 'package:local_storage_fitnessfourthausend_api/local_storage_fitnessfourthausend_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final trainingApi = LocalStorageFitnessfourthausendApi(
      plugin: await SharedPreferences.getInstance(),);

  bootstrap(trainingsApi: trainingApi);
}
