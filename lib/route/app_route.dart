import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screens/refund_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => MyWidget()),
    GoRoute(path: "/refund/:username", builder: (context, state){
      final username = state.pathParameters['username'];
      // final test = state.extra as BankModel;
      // final test1 = state.uri.queryParameters[];
      return RefundScreen(username:username);
    },)
  ]
);
