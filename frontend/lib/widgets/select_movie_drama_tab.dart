import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';

class SelectMovieDramaTab extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const SelectMovieDramaTab({super.key, required this.onTabSelected});

  @override
  _SelectMovieDramaTabState createState() => _SelectMovieDramaTabState();
}

class _SelectMovieDramaTabState extends State<SelectMovieDramaTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        widget.onTabSelected(tabController.index);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: '영화'),
        Tab(text: '드라마'),
      ],
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.mainOrangeColor,
            width: 4.0,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 18.0, // 텍스트 크기
        fontWeight: FontWeight.bold, // 텍스트 굵기
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16.0, // 선택되지 않은 탭의 텍스트 크기
        fontWeight: FontWeight.normal, // 선택되지 않은 탭의 텍스트 굵기
      ),
    );
  }
}
