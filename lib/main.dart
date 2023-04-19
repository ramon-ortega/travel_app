import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/src/pages/credits_page.dart';
import 'package:travel_app/src/pages/cubit/category_bloc.dart';
import 'package:travel_app/src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.montserratTextTheme();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
      ],
      child: MaterialApp(
        title: 'Travale App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          'credits/': (context) => const CreditsPage(),
        },
        theme: ThemeData.light().copyWith(
          textTheme: textTheme,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
