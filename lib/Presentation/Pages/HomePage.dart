import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmengstrain/Logic/Bloc/navigation/navigation_cubit.dart';
import 'package:mmengstrain/Logic/Constants/Navigation/nav_bar_items.dart';
import 'package:mmengstrain/Presentation/Grammar/grammar_check_screen.dart';
import 'package:mmengstrain/Presentation/Pronunciation/pronunciation_check_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MMENGstrain",
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.grammar) {
            return GrammarChecker();
          } else if (state.navbarItem == NavbarItem.pronunciation) {
            return PronunciationChecker();
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('Assets/Icons/grammar.png'),
                  label: 'Grammar'),
              BottomNavigationBarItem(
                  icon: Image.asset('Assets/Icons/pronunciation.png'),
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
          );
        },
      ),
    );
  }
}
