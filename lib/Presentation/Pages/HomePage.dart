import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/Pronunciation/text_field_text/textfield_text_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/grammar_check/grammar_check_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/navigation/navigation_cubit.dart';
import 'package:mmengstrain/Logic/Constants/Global/Colors.dart';
import 'package:mmengstrain/Logic/Constants/Navigation/nav_bar_items.dart';
import 'package:mmengstrain/Presentation/Grammar/grammar_check_screen.dart';
import 'package:mmengstrain/Presentation/Pronunciation/pronunciation_check_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.base,
              title: Text(
                state.navbarItem == NavbarItem.grammar
                    ? "Grammar Checker"
                    : state.navbarItem == NavbarItem.pronunciation
                        ? "Pronunciation Checker"
                        : "MM-ENG Self Train",
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
            body: state.navbarItem == NavbarItem.grammar
                ? BlocProvider(
                    create: (context) => GrammarCheckBloc(),
                    child: GrammarChecker(),
                  )
                : state.navbarItem == NavbarItem.pronunciation
                    ? BlocProvider(
                        create: (context) => TextfieldTextBloc(),
                        child: PronunciationChecker(),
                      )
                    : Container(),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              currentIndex: state.index,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.base,
              backgroundColor: AppColors.secondary,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('Assets/Icons/grammarcheck.png'),
                    label: 'Grammar'),
                BottomNavigationBarItem(
                    icon: Image.asset('Assets/Icons/voice.png'),
                    label: 'Pronunciation')
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.grammar);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.pronunciation);
                }
              },
            ));
      },
    );
  }
}
