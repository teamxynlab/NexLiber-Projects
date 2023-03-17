import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zample/components/landing/bloc/social_links_cubit.dart';
import 'package:zample/components/landing/bloc/social_links_state.dart';
import 'package:zample/misc/theme/colors.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialLinksCubit, SocialLinksState>(
      listener: ((context, state) {
        if (state.error.trim().isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
        }
      }),
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              height: 75,
              width: 75,
              child: InkWell(
                child: Image.asset("assets/icons/btn_google.png"),
                onTap: () => context.read<SocialLinksCubit>().loginWithGoogle(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => context.read<SocialLinksCubit>().noLogin(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Or continue without a profile",
                      style: Theme.of(context).textTheme.titleLarge),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: yellowColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
