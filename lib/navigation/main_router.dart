import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainRouter {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Home Screen')),
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/details'),
                child: const Text('Go to the Details screen'),
              ),
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(title: const Text('Details Screen')),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Go back to the Home screen'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
