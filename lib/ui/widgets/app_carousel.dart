import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/ui/shared/app_border_radius.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_padding.dart';

class AppCarousel extends StatefulWidget {
  final List<String> images;
  final double height;
  final double width;
  final double viewport;
  final List<String>? title;
  final List<String>? subtitle;
  final List<String>? rating;
  final bool useIndicator;
  final bool isLocation;
  final bool showRating;
  final bool autoPlay;
  final bool enlargeCenter;
  final bool isNews;
  final Function? onPressed;

  const AppCarousel({
    super.key,
    required this.images,
    this.height = 110,
    this.width = 200,
    this.viewport = 0.45,
    this.title,
    this.subtitle,
    this.rating,
    this.showRating = false,
    this.useIndicator = true,
    this.isLocation = false,
    this.autoPlay = true,
    this.enlargeCenter = true,
    this.isNews = false,
    this.onPressed,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPadding.kEdgeInsetsVerticalSmall,
          child: CarouselSlider(
            items: widget.images.map((image) {
              return InkWell(
                onTap: () => widget.onPressed,
                child: Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: AppBorderRadius.normalBorderRadius,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: widget.width,
                            height: widget.height,
                          ),
                        ),
                        widget.showRating
                            ? Positioned(
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    padding: AppPadding.kEdgeInsetsAllTiny,
                                    decoration: BoxDecoration(
                                        color: AppColors.kSecondaryFadeColor60,
                                        borderRadius:
                                            AppBorderRadius.smallBorderRadius),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 12,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                        Text(
                                          widget.rating == null
                                              ? ""
                                              : widget.rating![currentIndex],
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: AppColors.kPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        AppPadding.kEdgeInsetsHorizontalThin,
                                    child: Text(
                                      widget.title == null
                                          ? ""
                                          : widget.title![currentIndex],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: AppPadding.kEdgeInsetsAllTiny,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    widget.isLocation
                                        ? const Padding(
                                            padding: AppPadding
                                                .kEdgeInsetsHorizontalThin,
                                            child: Icon(
                                              Icons.location_on,
                                              size: 12,
                                              color: AppColors.kWhiteColor,
                                            ),
                                          )
                                        : const SizedBox(),
                                    Padding(
                                      padding: widget.isLocation
                                          ? EdgeInsets.zero
                                          : AppPadding
                                              .kEdgeInsetsHorizontalThin,
                                      child: Text(
                                        widget.subtitle == null
                                            ? ""
                                            : widget.subtitle![currentIndex],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: widget.height,
              aspectRatio: 16 / 9,
              viewportFraction: widget.viewport,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: widget.autoPlay,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: widget.enlargeCenter,
              enlargeFactor: 0.2,
              onPageChanged: (index, reason) {
                currentIndex = index;
                setState(() {});
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        widget.useIndicator
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.map((image) {
                  int index = widget.images.indexOf(image);

                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentIndex
                          ? AppColors.kPrimaryColor
                          : AppColors.klightGreyColor,
                    ),
                  );
                }).toList(),
              )
            : const SizedBox(),
      ],
    );
  }
}
