import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';
import 'package:wandertrip/ui/views/main/discover/discover_view.dart';
import 'package:wandertrip/ui/views/main/trips/trip_viewmodel.dart';
import 'package:wandertrip/ui/widgets/app_tabbar.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TripViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kWhiteColor,
          appBar: AppBar(
            title: Text(
              "Favorite",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: AppColors.kSecondaryColor,
              ),
            ),
            // actions: [
            //   Padding(
            //     padding: AppPadding.kEdgeInsetsAllNormal,
            //     child: Row(
            //       children: [
            //         const Icon(
            //           Icons.add,
            //           color: AppColors.kSecondaryColor,
            //         ),
            //         Text(
            //           "Create new trip",
            //           style: GoogleFonts.montserrat(
            //             fontSize: 14,
            //             fontWeight: FontWeight.w500,
            //             color: AppColors.kSecondaryColor,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
            backgroundColor: AppColors.kWhiteColor,
            elevation: 0.0,
          ),
          body: model.discoverModel.localImages!.isEmpty
              ? const Center(child: Text("Empty"))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.normalBorderRadius,
                          color: AppColors.kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0,
                                  3), // Shadow offset in the x and y direction
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              model.discoverModel.localImages!.isEmpty
                                  ? const SizedBox()
                                  : ClipRRect(
                                      borderRadius:
                                          AppBorderRadius.normalBorderRadius,
                                      child: index == 2
                                          ? SizedBox(
                                              height: 280,
                                              child: GoogleMap(
                                                  initialCameraPosition:
                                                      CameraPosition(
                                                          target: LatLng(
                                                              model
                                                                  .discoverModel
                                                                  .localityInfo[
                                                                      0]
                                                                  .latlng![0],
                                                              model
                                                                  .discoverModel
                                                                  .localityInfo[
                                                                      0]
                                                                  .latlng![1]))),
                                            )
                                          : SvgPicture.network(
                                              model.discoverModel
                                                      .localImages?[index] ??
                                                  "",
                                              fit: BoxFit.cover,
                                              height: 280,
                                            ),
                                    ),
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                  color: AppColors.kWhiteColor.withOpacity(0.7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.discoverModel.localTitle!.isEmpty
                                            ? ""
                                            : model.discoverModel
                                                .localTitle![index],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      AppSpacing.verticalSpaceMicroSmallest,
                                      Text(model.discoverModel.localSubtitle!
                                              .isEmpty
                                          ? ""
                                          : model.discoverModel
                                              .localSubtitle![index]),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        AppSpacing.horizontalSpaceSmall,
                    itemCount: 3,
                  ),
                ),
          // body: SingleChildScrollView(
          //   child: Padding(
          //     padding: AppPadding.kEdgeInsetsAllNormal,
          //     child: Column(
          //       children: [
          //         Row(
          //           children: [
          //             Text(
          //               "Favorite",
          //               style: GoogleFonts.montserrat(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w700,
          //                 color: AppColors.kSecondaryColor,
          //               ),
          //             ),
          //           ],
          //         ),
          //         AppCustomCarousel(
          //           overallHeight: 250,
          //           innerHeight: 230,
          //           images: [demoImages[0]],
          //           innerWidth: MediaQuery.of(context).size.width * 0.9,
          //           imageWidth: MediaQuery.of(context).size.width * 0.85,
          //         ),
          //         AppTabView(
          //           height: MediaQuery.of(context).size.height * 0.5,
          //           tabItems: const [
          //             'Upcoming',
          //             'History',
          //             'Saved',
          //           ],
          //           tabViewItems: [
          //             AppCustomCarousel(
          //               overallHeight: 250,
          //               innerHeight: 230,
          //               innerWidth: MediaQuery.of(context).size.width * 0.9,
          //               images: demoImages,
          //               scrollDirection: Axis.vertical,
          //               imageWidth: MediaQuery.of(context).size.width * 0.85,
          //             ),
          //             AppCustomCarousel(
          //               overallHeight: 250,
          //               innerHeight: 230,
          //               images: [demoImages[0]],
          //               scrollDirection: Axis.vertical,
          //               innerWidth: MediaQuery.of(context).size.width * 0.9,
          //               imageWidth: MediaQuery.of(context).size.width * 0.85,
          //             ),
          //             AppCustomCarousel(
          //               overallHeight: 250,
          //               innerHeight: 230,
          //               images: demoImages,
          //               scrollDirection: Axis.vertical,
          //               innerWidth: MediaQuery.of(context).size.width * 0.9,
          //               imageWidth: MediaQuery.of(context).size.width * 0.85,
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
      viewModelBuilder: () => TripViewModel(),
    );
  }
}
