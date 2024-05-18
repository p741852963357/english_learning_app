import 'package:auto_route/auto_route.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../domain/providers/flashcards_provider.dart';

@RoutePage()
class TypingResultScreen extends ConsumerStatefulWidget {
  const TypingResultScreen({super.key});

  @override
  ConsumerState<TypingResultScreen> createState() => _TypingResultScreenState();
}

class _TypingResultScreenState extends ConsumerState<TypingResultScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(flashcardsProvider);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Container(
        padding: const EdgeInsets.all(50),
        color: AppColors.lightGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: PieChart(
                    PieChartData(
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 30,
                      sections: [
                        PieChartSectionData(
                          color: Colors.red.shade600,
                          value: data.falseNum / (data.falseNum + data.trueNum),
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.green.shade500,
                          value: data.trueNum / (data.falseNum + data.trueNum),
                          title: '',
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 75,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Correct",
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            data.trueNum.toString(),
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Incorrect",
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            data.falseNum.toString(),
                            style: TextStyle(
                              color: Colors.red.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: AppColors.lightGrey,
        color: AppColors.lightGrey,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.transparent,
            backgroundColor: AppColors.blue,
          ),
          onPressed: () {
            ref.read(flashcardsProvider.notifier).reset();
            AutoRouter.of(context).replace(const TypingLearningRoute());
          },
          child: const Text(
            "Restart Quiz",
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
