// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
// import 'package:grad_project/core/extensions/context_extension.dart';
// import 'package:grad_project/core/managers/text_style_manager.dart';
// import '../../../../../../core/managers/color_manager.dart';
// import '../../../../../../core/navigation/router_path.dart';
// import '../../../domain/entities/user_orders_entity.dart';

// class TotalOrderCard extends StatelessWidget {
//   const TotalOrderCard({super.key, required this.order});

//   final UserOrdersEntity order;
//   @override
//   Widget build(BuildContext context) {
   
    
    
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(children: [
//             if (order.images != null && order.images!.isNotEmpty)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(order.images!.first,
//                     width: context.responsiveWidth(370),
//                     height: context.responsiveWidth(150),
//                     fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) => 
//             Container(
//               width: context.responsiveWidth(200),
//               height: context.responsiveWidth(100),
//               color: Colors.grey[300],
//               child: const Icon(Icons.broken_image, size: 40),
//             ),
//         ),
//       ),
            
//             const Gap(10),
//             Text(
//               order.name,
//               style: TextStyleManager.style12BoldBlue,
//             ),
//             const Gap(10),
//             Text(order.desc),
//             const Gap(10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           GoRouter.of(context).push(RouterPath.offersView);
//                         },
//                         child: const Text('العروض')),
//                     SizedBox(
//                       width: context.responsiveWidth(5),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(32),
//                           color: ColorManager.secondary),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 3),
//                         child: Text(
//                           '${order.offersCount}',
//                           style: TextStyleManager.style12BoldWhite,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "${order.price} ج.م",
//                   style: TextStyleManager.style12BoldPrimary,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ]),
//      ) );
//   }
// }
