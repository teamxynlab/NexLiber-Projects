import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zample/components/landing/ui/zample_social_links.dart';
import 'package:zample/misc/theme/colors.dart';

import '../bloc/social_links_cubit.dart';

/// [LandingScreen] with [SocialLinks]
class LandingScreen extends StatelessWidget {
  static const String route = "landing_route";

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
        ),
        Scaffold(
          backgroundColor: darkGreyColor,
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                    child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: size.width * 0.1,
                        right: size.width * 0.1,
                        top: size.width * 0.15,
                        bottom: size.width * 0.02,
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Welcome to Zample",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Choose a login option",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 300),
                    BlocProvider<SocialLinksCubit>(
                      create: (_) => SocialLinksCubit(),
                      child: const SocialLinks(),
                    )
                  ],
                )),
              ),
            );
          }),
        )
      ],
    );
  }
}
