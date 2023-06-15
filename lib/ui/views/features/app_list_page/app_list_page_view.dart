import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/models/countries_model.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';
import 'package:wandertrip/ui/views/features/app_list_page/app_list_page_viewmodel.dart';

class AppListPage extends StatelessWidget {
  final List<CountriesModel> countries;

  AppListPage({required this.countries});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppListPageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhiteColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "All Countries",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.kSecondaryColor,
            ),
          ),
          leading: TextButton(
            onPressed: () => {model.goBack()},
            child: Text(
              "Back",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.kSecondaryColor,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              padding: AppPadding.kEdgeInsetsHorizontalSmall,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.kNoColor,
                  width: 1,
                ),
                color: AppColors.kSecondaryFadeColor10,
                borderRadius: AppBorderRadius.normalBorderRadius,
              ),
              child: TextField(
                controller: model.searchController,
                onChanged: (value) {
                  model.filterSuggestions(value, countries);
                },
                decoration: const InputDecoration(
                  hintText: 'Search destinations',
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: AppColors.kSecondaryColor,
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: model.suggestion.isEmpty
                    ? countries.length
                    : model.suggestion.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 280,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: AppBorderRadius.normalBorderRadius,
                          child: SvgPicture.network(
                            model.suggestion.isEmpty
                                ? countries[index].flags!.svg.toString()
                                : model.suggestion[index].flags!.svg.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        model.addTofavorite(model.suggestion.isEmpty
                            ? countries[index]
                            : model.suggestion[index]);
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                    ),
                    title: Text(model.suggestion.isEmpty
                        ? countries[index].name!.common.toString()
                        : model.suggestion[index].name!.common.toString()),
                    subtitle: Text(model.suggestion.isEmpty
                        ? countries[index].continents!.first.toString()
                        : model.suggestion[index].continents!.first.toString()),
                    onTap: () {
                      model.goDetailPage(model.suggestion.isEmpty
                          ? countries[index]
                          : model.suggestion[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => AppListPageViewModel(),
    );
  }
}
