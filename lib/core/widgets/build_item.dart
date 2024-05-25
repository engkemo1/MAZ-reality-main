
// class BuildItem extends StatelessWidget {
//    BuildItem({super.key,required this.buildItem});
//   BuildItem buildItem ;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity.w,
//       margin: EdgeInsetsDirectional.fromSTEB(8.h, 8.h, 8.h, 8.h),
//       padding: EdgeInsetsDirectional.all(10.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       // ignore: sort_child_properties_last
//       child: GridTile(
//         child: Container(
//           color: Colors.grey,
//           child: buildItem.image.isNotEmpty
//               ? FadeInImage.assetNetwork(
//                   width: double.infinity.w,
//                   height: double.infinity.h,
//                   placeholder: "assets/imgs/loading.gif",
//                   image: buildItem.image,
//                   fit: BoxFit.cover,
//                 )
//               : Image.asset(
//                   "assets/imgs/icone_home",
//                 ),
//         ),
//         footer: Container(
//           width: double.infinity.w,
//           padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
//           color: Colors.black54,
//           alignment: Alignment.bottomCenter,
//           child: Text(
//             "${buildItem.name}",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20.sp,
//               fontWeight: FontWeight.bold,
//               height: 1.3.h,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
