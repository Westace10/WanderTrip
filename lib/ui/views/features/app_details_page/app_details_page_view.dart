import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/core/models/countries_model.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/views/features/app_details_page/app_details_page_viewmodel.dart';

class AppDetailsPage extends StatelessWidget {
  final String from;
  final CountriesModel? countryInfo;
  const AppDetailsPage({super.key, required this.from, this.countryInfo});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppDetailsPageViewModel>.reactive(
      // onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kWhiteColor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              from == "discover" ? "Your locality" : from,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    SvgPicture.network(
                      countryInfo!.flags!.svg!,
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                    Container(
                      color: Colors.white.withOpacity(0.6),
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              countryInfo!.name!.common!,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.kBlackColor,
                              ),
                            ),
                            Text(
                              countryInfo!.continents![0],
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                ListTile(
                  title: const Text('Area'),
                  subtitle: Text(countryInfo!.area.toString()),
                ),
                ListTile(
                  title: const Text('Population'),
                  subtitle: Text(countryInfo!.population.toString()),
                ),
                ListTile(
                  title: const Text('Timezone'),
                  subtitle: Text(countryInfo!.timezones![0].toString()),
                ),
                ListTile(
                  title: const Text('Start of the week'),
                  subtitle: Text(countryInfo!.startOfWeek.toString()),
                ),
              ],
            ),
          ),
          // body: Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     CarouselSlider(
          //       options: CarouselOptions(height: 200),
          //       items: [].map((image) {
          //         return Builder(
          //           builder: (BuildContext context) {
          //             return Image.asset(
          //               image,
          //               fit: BoxFit.cover,
          //             );
          //           },
          //         );
          //       }).toList(),
          //     ),
          //     SizedBox(height: 20),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         "name",
          //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.people),
          //       title: Text('Population'),
          //       subtitle: Text(0.toString()),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.person),
          //       title: Text('Citizens'),
          //       subtitle: Text([].join(', ')),
          //     ),
          //     ListTile(
          //       leading: Icon(Icons.language),
          //       title: Text('Language'),
          //       subtitle: Text(""),
          //     ),
          //   ],
          // ),
        ),
      ),
      viewModelBuilder: () => AppDetailsPageViewModel(),
    );
  }
}
