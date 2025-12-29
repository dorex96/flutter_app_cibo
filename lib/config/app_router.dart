/// Application routing configuration
library;

import 'package:go_router/go_router.dart';

import '../screens/elenco_contenitori_frigo_screen.dart';
import '../screens/dettaglio_contenitore_frigo_screen.dart';

/// Application router configuration
/// Defines all routes and navigation paths
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ElencoContenitoriFrigoScreen(),
    ),
    GoRoute(
      path: '/dettaglio-contenitore-frigo/:idContenitore',
      builder: (context, state) {
        final int idContenitore =
            int.tryParse(state.pathParameters['idContenitore'] ?? '') ??
            -1; // Default to -1 if is new container
        return DettaglioContenitoreFrigoScreen(idContenitore: idContenitore);
      },
    ),
  ],
);
