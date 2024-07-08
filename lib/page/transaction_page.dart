import 'package:flutter/material.dart';
import 'package:mobile/page/main_app.dart'; // Pastikan jalur impor sesuai dengan struktur direktori Anda

// Dummy data transaksi
class Transaction {
  final String productName;
  final int quantity;
  final double price;
  final DateTime date;

  Transaction({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.date,
  });
}

// List dummy transactions
List<Transaction> dummyTransactions = [
  Transaction(
      productName: "Cikal",
      quantity: 1,
      price: 15000,
      date: DateTime.now().subtract(Duration(days: 5))),
  Transaction(
      productName: "Gelondongan",
      quantity: 1,
      price: 10000,
      date: DateTime.now().subtract(Duration(days: 12))),
  Transaction(
      productName: "Batok",
      quantity: 1,
      price: 7000,
      date: DateTime.now().subtract(Duration(days: 25))),
  Transaction(
      productName: "Kelapa Parut",
      quantity: 1,
      price: 14000,
      date: DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      productName: "Santan",
      quantity: 1,
      price: 15000,
      date: DateTime.now().subtract(Duration(days: 8))),
];

// Fungsi untuk memfilter transaksi berdasarkan bulan
List<Transaction> filterTransactionsByMonth(
    List<Transaction> transactions, int month, int year) {
  return transactions
      .where((transaction) =>
          transaction.date.month == month && transaction.date.year == year)
      .toList();
}

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hitung total bulan ini dan bulan lalu
    final now = DateTime.now();
    final thisMonth = now.month;
    final thisYear = now.year;
    final lastMonth = now.month - 1 == 0 ? 12 : now.month - 1;
    final lastYear = lastMonth == 12 ? now.year - 1 : now.year;

    List<Transaction> thisMonthTransactions =
        filterTransactionsByMonth(dummyTransactions, thisMonth, thisYear);
    List<Transaction> lastMonthTransactions =
        filterTransactionsByMonth(dummyTransactions, lastMonth, lastYear);

    double totalThisMonth = thisMonthTransactions.fold(
        0.0,
        (previousValue, transaction) =>
            previousValue + transaction.price * transaction.quantity);
    double totalLastMonth = lastMonthTransactions.fold(
        0.0,
        (previousValue, transaction) =>
            previousValue + transaction.price * transaction.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Menggunakan Navigator untuk kembali ke MainAppPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainAppPage()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          _buildMonthSection(
              'bulan ini', totalThisMonth, thisMonthTransactions),
          _buildMonthSection(
              _getMonthName(lastMonth), totalLastMonth, lastMonthTransactions),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }

  Widget _buildMonthSection(
      String monthTitle, double totalAmount, List<Transaction> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(monthTitle),
          trailing: Text('\$ ${totalAmount.toStringAsFixed(2)}'),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              title: Text(transaction.productName),
              subtitle: Text(
                  'Qty: ${transaction.quantity} | Price: ${transaction.price.toStringAsFixed(2)}'),
              // Tidak menggunakan CircleAvatar untuk nomor urut
            );
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
