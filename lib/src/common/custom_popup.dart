import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/navigation.dart';
import '../../../helpers/responsive.dart';

customPopUp({
  required String title,
  required VoidCallback? primaryAction,
}) {
  return showDialog(
    context: Navigation.navigatorKey.currentContext!,
    builder: (context) {
      return SimpleDialog(
        title: Text(title),
        titleTextStyle: TextStyle(
          fontSize: 14 * AppUI.sp,
          color: AppColors.black,
        ),
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigation.navigatorKey.currentState!.pop();
                },
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 12 * AppUI.sp),
                ),
              ),
              SizedBox(width: 8 * AppUI.dw),
              ElevatedButton(
                onPressed: primaryAction,
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                ),
                child: Text(
                  'Yes',
                  style: TextStyle(fontSize: 12 * AppUI.sp),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

// class PopUpData extends StatelessWidget {
//   final String title;
//   final VoidCallback? primaryAction;

//   const PopUpData({super.key, required this.title, this.primaryAction});

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       title: Text(title),
//       titleTextStyle: TextStyle(
//         fontSize: 14 * AppUI.sp,
//         color: AppColors.black,
//       ),
//       children: [
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigation.navigatorKey.currentState!.pop();
//               },
//               child: Text(
//                 'No',
//                 style: TextStyle(fontSize: 12 * AppUI.sp),
//               ),
//             ),
//             SizedBox(width: 8 * AppUI.dw),
//             ElevatedButton(
//               onPressed: primaryAction,
//               style: TextButton.styleFrom(
//                 backgroundColor: AppColors.blue,
//                 foregroundColor: AppColors.white,
//               ),
//               child: Text(
//                 'Yes',
//                 style: TextStyle(fontSize: 12 * AppUI.sp),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
