/// Application routing configuration
library;

import 'package:go_router/go_router.dart';
import '../screens/elenco_contenitori_frigo_screen.dart';

/// Application router configuration
/// Defines all routes and navigation paths
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ElencoContenitoriFrigoScreen(),
    ),
  ],
);
