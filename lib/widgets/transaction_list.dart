import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  const TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, contraints) {
            return Column(children: <Widget>[
              const Text('No transactions added yet!'),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: contraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ]);
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  userTransactions: _userTransactions[index],
                  deleteTransaction: _deleteTransaction);
            },
            itemCount: _userTransactions.length,
          );
  }
}
