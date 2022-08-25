import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  const TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: _userTransactions.isEmpty
          ? Column(children: <Widget>[
              Text('No transactions added yet!'),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                              child:
                                  Text('\$${_userTransactions[index].amount}')),
                        ),
                      ),
                      title: Text(_userTransactions[index].title),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(_userTransactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            _deleteTransaction(_userTransactions[index].id),
                      )),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
