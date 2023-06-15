// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppTabView extends StatefulWidget {
  final List<String> tabItems;
  final List<Widget> tabViewItems;
  final double height;

  const AppTabView({
    super.key,
    required this.tabItems,
    required this.tabViewItems,
    this.height = 200,
  });
  @override
  _AppTabViewState createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: AppColors.kSecondaryColor,
            indicatorColor: AppColors.kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.kSecondaryColor,
            ),
            tabs: List.generate(
              widget.tabItems.length,
              (index) => Tab(
                text: widget.tabItems[index],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                widget.tabViewItems.length,
                (index) => widget.tabViewItems[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
