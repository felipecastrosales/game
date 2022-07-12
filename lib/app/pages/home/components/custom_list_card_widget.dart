// import 'package:flutter/material.dart';

// import 'package:game/app/pages/details/details_page.dart';
// import 'package:game/data/models/game/game_model.dart';

// class CustomListCardWidget extends StatelessWidget {
//   final GameModel game;

//   const CustomListCardWidget({
//     Key? key,
//     required this.game,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailsPage(game: ),
//               fullscreenDialog: true,
//             ),
//           );
//         },
//         child: Container(
//           height: 200,
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Hero(
//                   tag: game.id,
//                   child: Image.network(
//                     game.screenshots!,
//                     loadingBuilder: (_, child, progress) {
//                       if (progress == null) return child;
//                       return const Center(
//                         child: CircularProgressIndicator.adaptive(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         game.name,
//                         softWrap: true,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.headline6,
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
