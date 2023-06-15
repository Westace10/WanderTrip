import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wandertrip/core/services/global_variables.dart/countries.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';
import 'package:wandertrip/ui/shared/app_spacing.dart';
import 'package:wandertrip/ui/views/main/profile/profile_viewmodel.dart';
import 'package:wandertrip/ui/widgets/app_loader.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) => LoaderView(
        loading: model.isBusy,
        child: Scaffold(
          backgroundColor: AppColors.kWhiteColor,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  CountriesGV.username,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // const Text(
                //   'UI/UX Designer',
                //   style: TextStyle(fontSize: 16, color: Colors.grey),
                // ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(CountriesGV.useremail),
                ),

                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Location'),
                  subtitle: Text(CountriesGV.userlocation),
                ),
                AppSpacing.distinctVerticalSpace,
                TextButton(
                    onPressed: () => model.logOut(),
                    child: Text(
                      "Logout",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kRedColor,
                      ),
                    ))
              ],
              // children: [
              //   const AppProfileImage(),
              //   const AppContactDisplay(
              //     userName: "John Doe",
              //     userEmail: "john.doe@gmail.com",
              //     userPhone: "07035123456",
              //   ),
              //   // AppSpacing.verticalSpaceNormal,
              //   Column(
              //     children: [
              //       Padding(
              //         padding: AppPadding.kEdgeInsetsHorizontalSmall,
              //         child: Row(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: const [
              //             AppPromoCard(
              //               title: "Limited Offers",
              //               subtitle: "Special for you",
              //             ),
              //             AppSmallCardButton(
              //               icon: Icons.edit,
              //               buttonName: "Edit profile",
              //             )
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: AppPadding.kEdgeInsetsHorizontalSmall,
              //         child: Row(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: const [
              //             AppSmallCardButton(
              //               icon: Icons.wallet,
              //               buttonName: "Wallet",
              //             ),
              //             AppSmallCardButton(
              //               icon: Icons.browse_gallery,
              //               buttonName: "Gallery",
              //             ),
              //             AppSmallCardButton(
              //               icon: Icons.star_border_outlined,
              //               buttonName: "Reviews",
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: AppPadding.kEdgeInsetsHorizontalSmall,
              //         child: Row(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: const [
              //             AppWideCardButton(
              //               icon: Icons.settings,
              //               buttonName: "Settings",
              //             ),
              //           ],
              //         ),
              //       ),
              // TextButton(
              //     onPressed: () => model.logOut(),
              //     child: Text(
              //       "Logout",
              //       style: GoogleFonts.montserrat(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //         color: AppColors.kRedColor,
              //       ),
              //     ))
              //     ],
              //   )
              // ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
