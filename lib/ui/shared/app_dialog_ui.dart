// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'package:transolapp/app/app.locator.dart';
// import 'package:transolapp/enums/dialog_type.dart';
// import 'package:transolapp/ui/shared/app_border_radius.dart';
// import 'package:transolapp/ui/shared/app_colors.dart';
// import 'package:transolapp/ui/shared/app_spacing.dart';
// import 'package:transolapp/ui/shared/app_styles.dart';
// import 'package:transolapp/ui/widgets/app_buttons/app_button.dart';

// void setupDialogUi() {
//   final dialogService = locator<DialogService>();

//   final builders = {
//     DialogType.basic: (BuildContext context, DialogRequest request,
//             Function(DialogResponse) completer) =>
//         _BasicCustomDialog(dialogRequest: request, onDialogTap: completer),
//     DialogType.form: (BuildContext context, DialogRequest request,
//             Function(DialogResponse) completer) =>
//         _FormCustomDialog(dialogRequest: request, onDialogTap: completer),
//     DialogType.searchMech: (BuildContext context, DialogRequest request,
//             Function(DialogResponse) completer) =>
//         _SearchMechDialog(dialogRequest: request, onDialogTap: completer),
//   };

//   dialogService.registerCustomDialogBuilders(builders);
// }

// class _BasicCustomDialog extends StatelessWidget {
//   final DialogRequest? dialogRequest;
//   final Function(DialogResponse)? onDialogTap;
//   const _BasicCustomDialog({Key? key, this.dialogRequest, this.onDialogTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: AppColors.kWhiteColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               dialogRequest!.title!,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               dialogRequest!.description!,
//               style: const TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//               onTap: () => onDialogTap!(DialogResponse(confirmed: true)),
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: dialogRequest!.showIconInMainButton!
//                     ? const Icon(Icons.check_circle)
//                     : Text(dialogRequest!.mainButtonTitle!),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _FormCustomDialog extends HookWidget {
//   final DialogRequest? dialogRequest;
//   final Function(DialogResponse)? onDialogTap;
//   const _FormCustomDialog({Key? key, this.dialogRequest, this.onDialogTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var controller = useTextEditingController();
//     return Dialog(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               dialogRequest!.title!,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: controller,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//               onTap: () =>
//                   onDialogTap!(DialogResponse(data: [controller.text])),
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: dialogRequest!.showIconInMainButton!
//                     ? const Icon(Icons.check_circle)
//                     : Text(dialogRequest!.mainButtonTitle!),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SearchMechDialog extends StatefulWidget {
//   final DialogRequest? dialogRequest;
//   final Function(DialogResponse)? onDialogTap;
//   const _SearchMechDialog({Key? key, this.dialogRequest, this.onDialogTap})
//       : super(key: key);

//   @override
//   State<_SearchMechDialog> createState() => _SearchMechDialogState();
// }

// class _SearchMechDialogState extends State<_SearchMechDialog>
//     with TickerProviderStateMixin {
//   late final AnimationController _animationController = AnimationController(
//     duration: const Duration(milliseconds: 1500),
//     vsync: this,
//   )..repeat(reverse: false);

//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _animationController,
//     curve: Curves.linear,
//   );

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//     // _pageController = PageController(initialPage: 0, viewportFraction: 1.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 15.0),
//         decoration:
//             BoxDecoration(borderRadius: AppBorderRadius.mediumBorderRadius),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AppSpacing.verticalSpaceSmall,
//               RotationTransition(
//                 turns: _animation,
//                 child: SvgPicture.asset("assets/svg/searching.svg"),
//               ),
//               AppSpacing.verticalSpaceMicro,
//               Text(
//                 widget.dialogRequest!.title!,
//                 textAlign: TextAlign.center,
//               ),
//               AppSpacing.verticalSpaceMicro,
//               Text(
//                 widget.dialogRequest!.description!,
//                 textAlign: TextAlign.center,
//                 style: AppStyles.kPageHeadingSubTitle.copyWith(
//                   color: AppColors.kBlackColor,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 18,
//                 ),
//               ),
//               AppSpacing.verticalSpaceMicro,
//               AppButton.outlined(
//                 title: "Cancel",
//                 outlineButtonBorderColor: AppColors.kPrimaryColor,
//                 onTap: () {
//                   widget.onDialogTap!(DialogResponse(data: "done"));
//                 },
//               ),
//               AppSpacing.verticalSpaceSmall,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
