import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wandertrip/core/constants/app_constant.dart';
import 'package:wandertrip/ui/shared/app_colors.dart';

class AppProfileImage extends StatelessWidget {
  final double coverHeight;
  final double imageHeight;

  const AppProfileImage({
    super.key,
    this.coverHeight = 180,
    this.imageHeight = 120,
  });

  @override
  Widget build(BuildContext context) {
    // final topHeight = coverHeight - imageHeight / 2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(
              "My account",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: CircleAvatar(
              radius: imageHeight / 2,
              backgroundColor: Colors.white,
              foregroundImage: const NetworkImage(demoProfilePics),
            ),
          ),
        ],
      ),
    );
    // Stack(
    //     clipBehavior: Clip.none,
    //     alignment: Alignment.center,
    //     children: [
    //       Container(
    //         margin: EdgeInsets.only(bottom: imageHeight / 1.5),
    //         child: ClipRRect(
    //           borderRadius: const BorderRadius.only(
    //             bottomLeft: Radius.circular(35),
    //             bottomRight: Radius.circular(35),
    //           ),
    //           child: Image.network(
    //             demoImages[0],
    //             width: double.infinity,
    //             height: coverHeight,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: topHeight,
    //         child: Container(
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               width: 5.0,
    //               color: AppColors.kPrimaryColor,
    //             ),
    //             shape: BoxShape.circle,
    //           ),
    // child: CircleAvatar(
    //   radius: imageHeight / 2,
    //   backgroundColor: Colors.white,
    //   foregroundImage: const NetworkImage(demoProfilePics),
    // ),
    //         ),
    //       ),
    // Positioned(
    //   left: imageHeight / 2,
    //   top: imageHeight * 1.7,
    //   child: Column(
    //     children: const [
    //       Text(
    //         "39",
    //         style: TextStyle(
    //           color: Colors.black,
    //         ),
    //       ),
    //       Text(
    //         "Followers",
    //         style: TextStyle(
    //           color: Colors.black,
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    // Positioned(
    //   right: imageHeight / 2,
    //   top: imageHeight * 1.7,
    //   child: Column(
    //     children: const [
    //       Text(
    //         "39",
    //         style: TextStyle(
    //           color: Colors.black,
    //         ),
    //       ),
    //       Text(
    //         "Followers",
    //         style: TextStyle(
    //           color: Colors.black,
    //         ),
    //       ),
    //     ],
    //   ),
    // )
    // ]);
  }
}




// import 'package:flutter/material.dart';
// import 'package:wandertrip/core/constants/app_constant.dart';

// class ScrollAnimationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 200,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Scroll Animation D'),
//               background: Image.network(
//                 demoImages[0],
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 200, // Set the desired height for the scrolling widget
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return CircleAvatar(
//                     radius: 50,
//                     child: Text('Avatar $index'),
//                   );
//                 },
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//               childCount: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
