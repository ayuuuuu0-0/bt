// import 'dart:developer';

// import 'package:bt/widgets/category_list.dart';
// import 'package:bt/widgets/tab_bar_view.dart';
// import 'package:bt/widgets/time_line_month.dart';
// import 'package:flutter/material.dart';

// class TransactionScreen extends StatelessWidget {
//   const TransactionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String? monthYear;
//     String? category;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Expansive"),
//       ),
//       body: Column(
//         children: [
//           TimeLineMonth(
//             onChanged: (String? value) {
//               if (value != null) {
//                 monthYear = value;
//               }
//             },
//           ),
//           CategoryList(
//             onChanged: (String? value) {
//               if (value != null) {
//                 category = value;
//               }
//             },
//           ),
//           TypeTabBar(category: category!, monthYear: monthYear!)
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:bt/widgets/category_list.dart';
import 'package:bt/widgets/tab_bar_view.dart';
import 'package:bt/widgets/time_line_month.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    String monthYear = '';
    String category = '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Expansive"),
      ),
      body: Column(
        children: [
          TimeLineMonth(
            onChanged: (String? value) {
              monthYear = value ?? '';
            },
          ),
          CategoryList(
            onChanged: (String? value) {
              category = value ?? '';
            },
          ),
          TypeTabBar(category: category, monthYear: monthYear),
        ],
      ),
    );
  }
}
