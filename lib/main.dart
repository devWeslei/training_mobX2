import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'home.dart';

void main() {
  runApp(MultiProvider(
      // create: (_) => Controller(),
    providers: [
      Provider<Controller>(
          create: (_) => Controller()
      )
    ],
    child: const MaterialApp(
      home: Home(),
    ),
  )
  );
}
