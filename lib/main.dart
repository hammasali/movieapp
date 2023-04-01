import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/presentation/widgets/movie_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'data/tables/movie_table.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //final appDocumentDir = await getApplicationDocumentsDirectory();
  //Hive.init(appDocumentDir.path);
  //Hive.registerAdapter(MovieTableAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieTableAdapter());
  getIt.init();
  runApp(MovieApp());
}
