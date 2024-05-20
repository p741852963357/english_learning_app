import 'package:auto_route/auto_route.dart';
import 'package:client/features/library/domain/providers/flashcards_provider.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_colors.dart';

@RoutePage()
class FlashcardsResultScreen extends ConsumerStatefulWidget {
  const FlashcardsResultScreen({
    super.key,
  });

  @override
  ConsumerState<FlashcardsResultScreen> createState() => _FlashcardsResultScreenState();
}

class _FlashcardsResultScreenState extends ConsumerState<FlashcardsResultScreen> {
  int touchedIndex = -1;
  @override
  void initState() {
    super.initState();
  }

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
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      swapAnimationDuration: Duration.zero,
                      PieChartData(
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            color: Colors.orange.shade500,
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
                            "Know",
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
                            "Still learning",
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            data.falseNum.toString(),
                            style: TextStyle(
                              color: Colors.orange.shade700,
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
              AutoRouter.of(context).push(const FlashcardsLearningRoute());
            },
            child: const Text(
              "Restart Flashcards",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          )),
    );
  }
}
