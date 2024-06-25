import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ucan/screen/home/view/ucan_view.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(), child: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: selectedTab.index,
              children: const [
                UcanHomeScreen(),
                UcanHomeScreen(),
                UcanHomeScreen(),
                UcanHomeScreen()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SizedBox(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: []),
          ),
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    this.icon,
    required this.text,
    this.assetName,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final IconData? icon;
  final String text;
  final String? assetName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetName!,
            width: 32,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
