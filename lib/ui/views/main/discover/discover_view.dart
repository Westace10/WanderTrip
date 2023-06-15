import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/core/services/global_variables.dart/countries.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';
import 'package:wandertrip/ui/views/main/discover/discover_viewmodel.dart';
import 'package:wandertrip/ui/widgets/app_appbar_secondary.dart';
import 'package:wandertrip/ui/widgets/app_floating_button.dart';
import 'package:wandertrip/ui/widgets/app_loader.dart';
import 'package:wandertrip/ui/widgets/app_searchbox.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiscoverViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (context, model, child) => SafeArea(
        child: LoaderView(
          loading: model.isBusy,
          child: Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: Padding(
              padding: AppPadding.kEdgeInsetsAllNormal,
              child: Column(
                children: [
                  AppSpacing.verticalSpaceMicro,
                  AppAppBarSec(
                    userName: CountriesGV.username,
                    location: CountriesGV.userlocation,
                    profilePicture:
                        "assets/png/short_logo.png", // Replace with the actual URL of the user's profile picture
                  ),
                  AppSpacing.verticalSpaceMicro,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppSectionHeader(
                            title: "Continents",
                            buttonName: "View all",
                            onPressed: () {
                              model.goListPage();
                            },
                          ),
                          AppCustomCarousel(
                            model: model,
                            description:
                                "hbvdvf dkjhfvbdbvfkdb vhvbdikbv dk vhisbdfjd dfv dhvbdivb dvjifbdkfv dvbib fvhdbfvkdf vhdbvodvnldkfvodfvbdjfv dhfvbodjfv jfbvobd fvjdkfbvdlfkvdkbfvidkbv olfvbufkv hdfbivk fvjdbuufkjvb dhvbidfkbvodfivbo dfkhv bhfibvksnfovjnjf ovhfbvodfbvoj",
                            title: "Taun Chaun Island",
                            subtitle: const AppDiscoverSubtitle(),
                            asiaCount: CountriesGV.asianCountries.length,
                            africaCount: CountriesGV.africanCountries.length,
                            antarcticaCount:
                                CountriesGV.antarcticanCountries.length,
                            oceaniaCount:
                                CountriesGV.australianCountries.length,
                            northAmericaCount:
                                CountriesGV.northAmericanCountries.length,
                            southAmericaCount:
                                CountriesGV.southAmericanCountries.length,
                            europeCount: CountriesGV.europeanCountries.length,
                          ),
                          AppSectionHeader(
                            title: "Your Locality",
                            buttonName: "View more",
                            onPressed: () {
                              model.goDetailPage(model.localityInfo[0]);
                            },
                          ),
                          SizedBox(
                            height: 280,
                            child: ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  model.goDetailPage(model.localityInfo[0]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          AppBorderRadius.normalBorderRadius,
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
                                          CountriesGV.locality.isEmpty
                                              ? const SizedBox()
                                              : ClipRRect(
                                                  borderRadius: AppBorderRadius
                                                      .normalBorderRadius,
                                                  child: index == 2
                                                      ? GoogleMap(
                                                          initialCameraPosition: CameraPosition(
                                                              target: LatLng(
                                                                  CountriesGV
                                                                          .locality[
                                                                              0]
                                                                          .latlng![
                                                                      0],
                                                                  CountriesGV
                                                                      .locality[
                                                                          0]
                                                                      .latlng![1])))
                                                      : SvgPicture.network(
                                                          CountriesGV
                                                                  .localityImage[
                                                              index],
                                                          fit: BoxFit.cover,
                                                          height: 280,
                                                        ),
                                                ),
                                          Container(
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                              ),
                                              color: AppColors.kWhiteColor
                                                  .withOpacity(0.7),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    CountriesGV.localityTitle
                                                            .isEmpty
                                                        ? ""
                                                        : CountriesGV
                                                                .localityTitle[
                                                            index],
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  AppSpacing
                                                      .verticalSpaceMicroSmallest,
                                                  Text(CountriesGV
                                                          .localitySubtitle
                                                          .isEmpty
                                                      ? ""
                                                      : CountriesGV
                                                              .localitySubtitle[
                                                          index]),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  AppSpacing.horizontalSpaceSmall,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          AppSpacing.verticalSpaceMicro,
                        ],
                        // Your app content here
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: const AppFloatingActionButton(
              visible: true,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => DiscoverViewModel(),
    );
  }
}

// class GoogleMapContainer extends StatelessWidget {
//   final String mapUrl;
//   final double? height;
//   final double? width;

//   const GoogleMapContainer({
//     required this.mapUrl,
//     this.height,
//     this.width,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       width: width,
//       child: WebView(
//         initialUrl: mapUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

class AppSectionHeader extends StatelessWidget {
  final String title;
  final String? buttonName;
  final Function? onPressed;
  const AppSectionHeader({
    super.key,
    required this.title,
    this.buttonName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.kSecondaryColor,
          ),
        ),
        TextButton(
          onPressed: () => onPressed == null ? {} : onPressed!(),
          child: Text(
            buttonName ?? "",
          ),
        ),
      ],
    );
  }
}

class AppCustomCarousel extends StatelessWidget {
  final double overallHeight;
  final double innerHeight;
  final double? innerWidth;
  final double? imageWidth;
  final String? title;
  final Widget subtitle;
  final String? description;
  final List<String> images;
  final Axis scrollDirection;
  final int? asiaCount;
  final int? africaCount;
  final int? antarcticaCount;
  final int? europeCount;
  final int? oceaniaCount;
  final int? northAmericaCount;
  final int? southAmericaCount;
  final DiscoverViewModel? model;
  const AppCustomCarousel({
    super.key,
    this.overallHeight = 230,
    this.innerHeight = 230,
    this.innerWidth,
    this.imageWidth,
    this.title,
    this.subtitle = const SizedBox(),
    this.description,
    this.images = demoImages,
    this.scrollDirection = Axis.horizontal,
    this.asiaCount,
    this.africaCount,
    this.antarcticaCount,
    this.europeCount,
    this.oceaniaCount,
    this.northAmericaCount,
    this.southAmericaCount,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: overallHeight,
      child: ListView.separated(
        separatorBuilder: (context, index) => AppSpacing.horizontalSpaceSmall,
        itemCount: images.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            model!.goListPage(index: index);
          },
          child: AppCountryCard(
            index: index,
            innerWidth: innerWidth,
            images: images,
            innerHeight: innerHeight,
            africaCount: africaCount,
            asiaCount: asiaCount,
            antarcticaCount: antarcticaCount,
            northAmericaCount: northAmericaCount,
            southAmericaCount: southAmericaCount,
            oceaniaCount: oceaniaCount,
            europeCount: europeCount,
          ),
        ),
        scrollDirection: scrollDirection,
      ),
    );
  }
}

class AppCountryCard extends StatelessWidget {
  const AppCountryCard({
    super.key,
    required this.innerWidth,
    required this.images,
    required this.innerHeight,
    required this.africaCount,
    required this.asiaCount,
    required this.antarcticaCount,
    required this.northAmericaCount,
    required this.southAmericaCount,
    required this.oceaniaCount,
    required this.europeCount,
    required this.index,
  });

  final double? innerWidth;
  final List<String> images;
  final double innerHeight;
  final int? africaCount;
  final int? asiaCount;
  final int? antarcticaCount;
  final int? northAmericaCount;
  final int? southAmericaCount;
  final int? oceaniaCount;
  final int? europeCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: innerWidth ?? MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.normalBorderRadius,
          color: AppColors.kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: AppBorderRadius.normalBorderRadius,
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  height: innerHeight,
                ),
              ),
              Container(
                height: 70,
                width: innerWidth ?? MediaQuery.of(context).size.width * 0.35,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        demoTitle[index],
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      AppSpacing.verticalSpaceMicroSmallest,
                      Text(
                        index == 0
                            ? "$africaCount Countries"
                            : index == 1
                                ? "$asiaCount Countries"
                                : index == 2
                                    ? "$antarcticaCount Countries"
                                    : index == 3
                                        ? "$northAmericaCount Countries"
                                        : index == 4
                                            ? "$southAmericaCount Countries"
                                            : index == 5
                                                ? "$oceaniaCount Countries"
                                                : index == 6
                                                    ? "$europeCount Countries"
                                                    : demoTitle[index],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppDiscoverSubtitle extends StatelessWidget {
  const AppDiscoverSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 14,
            ),
            Text(
              "4.9",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.kSecondaryColor,
              ),
            ),
            Text(
              "(957 ratings)",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.kSecondaryColor,
              ),
            ),
          ],
        ),
        Text(
          "|",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.klightGreyColor,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.message,
              size: 14,
            ),
            Padding(
              padding: AppPadding.kEdgeInsetsHorizontalThinner,
              child: Text(
                "Reviews",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
