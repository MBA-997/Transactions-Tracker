import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required Transaction userTransactions,
    required Function deleteTransaction,
  })  : _userTransactions = userTransactions,
        _deleteTransaction = deleteTransaction,
        super(key: key);

  final Transaction _userTransactions;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$${_userTransactions.amount}')),
            ),
          ),
          title: Text(_userTransactions.title),
          subtitle: Text(DateFormat.yMMMd().format(_userTransactions.date)),
          trailing: MediaQuery.of(context).size.width > 460
              ? TextButton(
                  onPressed: () => _deleteTransaction(_userTransactions.id),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).errorColor)),
                  child: Icon(Icons.delete))
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => _deleteTransaction(_userTransactions.id),
                )),
    );
  }
}
