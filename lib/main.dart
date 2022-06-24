// import './models/transaction.dart';
// import 'package:flutter/material.dart';
// import './widgets/newtransaction.dart';
// import './widgets/transaction_list.dart';
// import './widgets/chart.dart';
// import 'package:flutter/services.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       home: MyHomePage(),
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         accentColor: Colors.amber,
//         fontFamily: "Quicksand",
//         textTheme: ThemeData.light().textTheme.copyWith(
//               title: TextStyle(
//                 fontFamily: "OpenSans",
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//               button: TextStyle(color: Colors.white),
//             ),
//         appBarTheme: AppBarTheme(
//           textTheme: ThemeData.light().textTheme.copyWith(
//               title: TextStyle(
//                   fontFamily: "OpenSans",
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold)),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Transaction> userTransactions = [];
//   //   Transaction(_deleteTransaction
//   //     id: "t1",
//   //     title: "Book",
//   //     amount: 45.98,
//   //     date: DateTime.now(),
//   //   ),
//   //   Transaction(
//   //     id: "t2",
//   //     title: "Eat",
//   //     amount: 5,
//   //     date: DateTime.now(),
//   //   ),
//   // ];
//   bool _showChart = false;
//   List<Transaction> get _recentTransactions {
//     return userTransactions.where((tx) {
//       return tx.date.isAfter(
//         DateTime.now().subtract(
//           Duration(days: 7),
//         ),
//       );
//     }).toList();
//   }

//   void addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
//     final nextTx = Transaction(
//       id: DateTime.now().toString(),
//       title: txTitle,
//       amount: txAmount,
//       date: chosenDate,
//       // date: DateTime.now(),
//     );
//     setState(() {
//       userTransactions.add(nextTx);
//     });
//   }

//   void _startAddNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {},
//           child: NewTransaction(addNewTransaction),
//           behavior: HitTestBehavior.opaque,
//         );
//       },
//     );
//   }

//   void _deleteTransaction(String id) {
//     setState(() {
//       userTransactions.removeWhere((tx) => tx.id == id);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final appBar = AppBar(
//     //   title: Text('Flutter App'),
//     //   actions: [
//     //     IconButton(
//     //       icon: Icon(Icons.add),
//     //       onPressed: () => _startAddNewTransaction(context),
//     //     ),
//     //   ],
//     // );
//     // return Scaffold(
//     //   appBar: appBar,
//     //   body: SingleChildScrollView(
//     //     child: Column(
//     //       children: [
//     //         Container(
//     //           height: (MediaQuery.of(context).size.height -
//     //                   appBar.preferredSize.height -
//     //                   MediaQuery.of(context).padding.top) *
//     //               0.3,
//     //           child: Chart(_recentTransactions),
//     //         ),
//     //         Container(
//     //           height: (MediaQuery.of(context).size.height -
//     //                   appBar.preferredSize.height -
//     //                   MediaQuery.of(context).padding.top) *
//     //               0.7,
//     //           child: TransactionList(userTransactions, _deleteTransaction),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     final isLandscape =
//         MediaQuery.of(context).orientation == Orientation.landscape;
//     final appBar = AppBar(
//       title: Text(
//         'Personal Expenses',
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () => _startAddNewTransaction(context),
//         ),
//       ],
//     );
//     final txListWidget = Container(
//       height: (MediaQuery.of(context).size.height -
//               appBar.preferredSize.height -
//               MediaQuery.of(context).padding.top) *
//           0.7,
//       child: TransactionList(userTransactions, _deleteTransaction),
//     );
//     return Scaffold(
//       appBar: appBar,
//       body: SingleChildScrollView(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             if (isLandscape)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Show Chart'),
//                   Switch(
//                     value: _showChart,
//                     onChanged: (val) {
//                       setState(() {
//                         _showChart = val;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             if (!isLandscape)
//               Container(
//                 height: (MediaQuery.of(context).size.height -
//                         appBar.preferredSize.height -
//                         MediaQuery.of(context).padding.top) *
//                     0.3,
//                 child: Chart(_recentTransactions),
//               ),
//             if (!isLandscape) txListWidget,
//             if (isLandscape)
//               _showChart
//                   ? Container(
//                       height: (MediaQuery.of(context).size.height -
//                               appBar.preferredSize.height -
//                               MediaQuery.of(context).padding.top) *
//                           0.7,
//                       child: Chart(_recentTransactions),
//                     )
//                   : txListWidget
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _startAddNewTransaction(context),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/newtransaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          // errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Widget> _buildLandscapeContent(
    MediaQueryData mediaQuery,
    AppBar appBar,
    Widget txListWidget,
  ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.title,
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransactions),
            )
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(
    MediaQueryData mediaQuery,
    AppBar appBar,
    Widget txListWidget,
  ) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('build() MyHomePageState');
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    // final PreferredSizeWidget appBar = Platform.isIOS
    final appBar = AppBar(
      title: Text(
        'Personal Expenses',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              ..._buildLandscapeContent(
                mediaQuery,
                appBar,
                txListWidget,
              ),
            if (!isLandscape)
              ..._buildPortraitContent(
                mediaQuery,
                appBar,
                txListWidget,
              ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
    );
  }
}
