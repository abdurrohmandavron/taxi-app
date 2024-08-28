import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/utils/constants.dart';
import 'package:yollararo/cubits/services_cubit.dart';
import 'package:yollararo/presentations/widgets/custom_icon.dart';

class YServiceButtons extends StatelessWidget {
  const YServiceButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YServiceCubit, int>(
      builder: (context, state) {
        final cubit = context.read<YServiceCubit>();

        return SizedBox(
          height: 36,
          width: MediaQuery.of(context).size.width - 32,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: cubit.transportServices.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) {
              final transportService = cubit.transportServices[index];

              return GestureDetector(
                onTap: () => cubit.chooseService(index),
                child: Container(
                  width: 110,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: state == index ? const Color(0xFFF1F7FD) : const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      YIcon(transportService.icon, color: state == index ? YColors.primary : null),
                      const SizedBox(width: 8),
                      Text(
                        transportService.name,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: state == index ? YColors.primary : null),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
