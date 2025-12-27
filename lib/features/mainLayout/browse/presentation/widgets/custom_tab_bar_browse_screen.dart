import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/features/mainLayout/browse/presentation/browse_view_model/browse_view_model.dart';
import 'package:movies/features/mainLayout/browse/presentation/widgets/csutom_tab_item.dart';
import 'package:movies/features/mainLayout/home/presentation/movies_list_view_model/movies_list_veiw_model.dart';

class CustomTabBarBrowseScreen extends StatefulWidget {
  CustomTabBarBrowseScreen({super.key, required this.categories});

  final List<String> categories;

  @override
  State<CustomTabBarBrowseScreen> createState() => _CustomTabBarBrowseScreenState();
}

class _CustomTabBarBrowseScreenState extends State<CustomTabBarBrowseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
          context.read<BrowseViewModel>().currentCategory=widget.categories[index];
          context.read<BrowseViewModel>().getFilteredMoviesForEachCategory();
          context.read<BrowseViewModel>().pageCount=1;

          context.read<BrowseViewModel>().forceLoadMoreOnEntry();
        },
        isScrollable: true,
        tabs: List.generate(
          widget.categories.length,
          (index) => CustomTabItem(
            category: widget.categories[index],
            isSelectedTab: selectedIndex == index,
            selectedTextStyle: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.pureBlack,
            ),
            unSelectedTextStyle: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.yellow,
            ),
            selectedContainerColor: ColorsManager.yellow,
            unSelectedContainerColor: ColorsManager.black,
          ),
        ),
      ),
    );
  }
}
