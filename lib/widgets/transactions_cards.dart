// import 'package:bt/utils/icons_list.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'transaction_card.dart';

// class TransactionsCard extends StatefulWidget {
//   TransactionsCard({Key? key}) : super(key: key);

//   @override
//   _TransactionsCardState createState() => _TransactionsCardState();
// }

// class _TransactionsCardState extends State<TransactionsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(15),
//           child: Row(
//             children: [
//               Text("Recent Transaction",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
//             ],
//           ),
//         ),
//         RecentTransactionsList(),
//       ],
//     );
//   }
// }

// class RecentTransactionsList extends StatefulWidget {
//   RecentTransactionsList({Key? key}) : super(key: key);

//   @override
//   _RecentTransactionsListState createState() => _RecentTransactionsListState();
// }

// class _RecentTransactionsListState extends State<RecentTransactionsList> {
//   final userId = FirebaseAuth.instance.currentUser!.uid;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .doc(userId)
//             .collection("transactions")
//             .orderBy('timestamp', descending: true)
//             .limit(20)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("Loading");
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No transactions found.'));
//           }
//           var data = snapshot.data!.docs;
//           print(data);
//           return ListView.builder(
//               shrinkWrap: true,
//               itemCount: data.length,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 var cardData = data[index];
//                 return TransactionCard(
//                   data: cardData,
//                 );
//               });
//         });
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionsCard extends StatefulWidget {
  final String userId;

  TransactionsCard({required this.userId});

  @override
  _TransactionsCardState createState() => _TransactionsCardState();
}

class _TransactionsCardState extends State<TransactionsCard> {
  List<QueryDocumentSnapshot> transactions = [];
  @override
  getMyData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('transactions')
        .orderBy('timestamp', descending: true)
        .limit(20)
        .get()
        .then((results) {
      setState(() {
        transactions = results.docs;
      });
    });
  }

  void initState() {
    super.initState();
    getMyData();
  }

//   @override
//   Widget build(BuildContext context) {
//     print(transactions.length);
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection("transactions")
//           .orderBy('timestamp', descending: true)
//           .limit(20)
//           .snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           print('Error fetching data: ${snapshot.error}');
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Text('No transactions found.');
//         }

//         return ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             var transaction = snapshot.data!.docs[index];
//             return ListTile(
//               title: Text(transaction['title']),
//               subtitle: Text(transaction['amount'].toString()),
//             );
//           },
//         );
//       },
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    print(transactions.length);
    if (transactions.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          var transaction = transactions[index];
          return ListTile(
            title: Text(transaction['title']),
            subtitle: Text(transaction['amount'].toString()),
          );
        },
      );
    }
  }
}
