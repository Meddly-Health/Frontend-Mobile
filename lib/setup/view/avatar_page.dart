import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../blocs.dart';
import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Selecciona tu avatar',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 35),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [...getAvatarTypes()],
            );
          },
        ),
        const SizedBox(height: 16),
        Text(
          'Color de piel',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ...getSkinColor(),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        Text(
          'Color de pelo',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ...getHairColor(),
              ],
            );
          },
        ),
        const Spacer(),
        const SizedBox(height: 16),
        BlocBuilder<SetupCubit, SetupState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Button(
                    enabled: true,
                    onPressed: () {
                      if (state.status.isSubmissionInProgress) return;
                      context.read<SetupCubit>().pageController!.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    },
                    animate: false,
                    enabledColor: Theme.of(context).colorScheme.primary,
                    disbaledColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    label: 'Volver atrás',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Button(
                    enabled: true,
                    onPressed: () {
                      if (state.status.isSubmissionInProgress) return;
                      HapticFeedback.lightImpact();
                      context.read<SetupCubit>().saveUserData();
                    },
                    animate: state.status.isSubmissionInProgress,
                    enabledColor: Theme.of(context).colorScheme.primary,
                    disbaledColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    label: 'Siguiente',
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        const OmitButton()
      ],
    );
  }
}

class _ColorCircle extends StatelessWidget {
  const _ColorCircle({
    Key? key,
    required this.color,
    required this.isPressed,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isPressed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
          radius: MediaQuery.of(context).size.width / 10,
          backgroundColor: isPressed ? null : Colors.transparent,
          child: CircleAvatar(
              radius: (MediaQuery.of(context).size.width / 10) * 0.9,
              backgroundColor: color)),
    );
  }
}

List<Widget> getAvatarTypes() {
  var avatarTypes = ['1', '2', '3', '4', '5', '6'];

  return avatarTypes.map((avatarType) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<SetupCubit>().avatarType(avatarType);
          },
          child: CircleAvatar(
              radius: MediaQuery.of(context).size.width / 8,
              backgroundColor:
                  state.avatar[20] == avatarType ? null : Colors.transparent,
              child: CircleAvatar(
                  radius: (MediaQuery.of(context).size.width / 8) * 0.9,
                  child: SvgPicture.asset(
                      'assets/avatar/avatar$avatarType-${state.avatar[22]}-${state.avatar[24]}.svg'),
                  backgroundColor: Theme.of(context).colorScheme.secondary)),
        );
      },
    );
  }).toList();
}

List<Widget> getSkinColor() {
  var skinColors = [lightSkin, mediumSkin, darkSkin];
  var skinColorStrings = ['1', '2', '3'];

  return skinColorStrings.map((skinColorString) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return _ColorCircle(
            onTap: () {
              context.read<SetupCubit>().skinColorChanged(skinColorString);
            },
            color: skinColors[int.parse(skinColorString) - 1],
            isPressed: state.avatar[22] == skinColorString);
      },
    );
  }).toList();
}

List<Widget> getHairColor() {
  var hairColors = [brunette, brown, blonde];
  var hairColorsStrings = ['1', '2', '3'];

  return hairColorsStrings.map((hairColorString) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return _ColorCircle(
            onTap: () {
              context.read<SetupCubit>().hairColorChanged(hairColorString);
            },
            color: hairColors[int.parse(hairColorString) - 1],
            isPressed: state.avatar[24] == hairColorString);
      },
    );
  }).toList();
}
