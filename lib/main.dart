import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/config/configure_dependencies.dart';
import 'src/screens/main/bloc/main_bloc.dart';
import 'src/screens/main/ui/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<MainBloc>(
        create: (_) => MainBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: const MainScreen(),
      ),
    );
  }
}
