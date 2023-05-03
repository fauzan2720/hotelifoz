import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final AssetImage? imageIcon;
  final String? imageNetworkIcon;

  const BottomNavItem({
    super.key,
    required this.index,
    this.imageIcon,
    this.imageNetworkIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        IconButton(
          onPressed: () {
            context.read<PageCubit>().setPage(index);
          },
          icon: imageIcon != null
              ? ImageIcon(
                  imageIcon!,
                  size: 20.0,
                  color: context.watch<PageCubit>().state == index
                      ? AppColors.primary
                      : AppColors.secondary,
                )
              : SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageNetworkIcon!),
                  ),
                ),
        ),
        const Spacer(),
        if (context.read<PageCubit>().state == index)
          Container(
            height: 2.0,
            width: 30.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(1000.0)),
              color: AppColors.primary,
            ),
          ),
      ],
    );
  }
}
