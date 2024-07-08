import 'package:flutter/material.dart';
import 'package:mobile/page/main_app.dart'; // Impor halaman main_app

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data untuk notifikasi
    List<Map<String, String>> notifications = [
      {"title": "Pesanan Diterima", "body": "Pesanan Anda telah diterima."},
      {
        "title": "Pembayaran Berhasil",
        "body": "Pembayaran Anda telah berhasil."
      },
      {
        "title": "Pengiriman Dimulai",
        "body": "Pesanan Anda sedang dalam perjalanan."
      },
      {"title": "Pesanan Selesai", "body": "Pesanan Anda telah selesai."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainAppPage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                notifications[index]["title"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notifications[index]["body"]!),
              leading: Icon(Icons.notifications),
            ),
          );
        },
      ),
    );
  }
}
