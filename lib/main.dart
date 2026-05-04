import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_porto_smkid/futures/presentasi/auth/bloc/auth_bloc.dart';
import 'package:flutter_porto_smkid/futures/presentasi/auth/bloc/auth_event.dart';

import 'futures/presentasi/auth/pages/register_page.dart';
import 'futures/presentasi/pages/intro_screen.dart';
import 'futures/presentasi/pages/users/users_dashboard.dart';

void main() {
  runApp(const aspi());
}

class aspi extends StatelessWidget {
  const aspi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckAuthStatusEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Aksi",
        initialRoute: '/',
        routes: {
          '/' : (context) => const IntroScreen(),
          '/register' : (context) => const RegisterPage(),
          '/dashboard' : (context) =>DashboardPage(),
        },
      ),
    );
  }
}
