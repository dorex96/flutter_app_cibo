/// Application routing configuration
library;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../screens/elenco_contenitori_frigo_screen.dart';
import '../screens/dettaglio_contenitore_frigo_screen.dart';
import '../bloc/elenco_contenitori_frigo_screen/elenco_contenitori_frigo_screen_bloc.dart';

/// Application router configuration
/// Defines all routes and navigation paths
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => ElencoContenitoriFrigoScreenBloc(),
          child: const ElencoContenitoriFrigoScreen(),
        );
      },
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
