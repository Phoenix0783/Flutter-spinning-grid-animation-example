import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String title;
  Note(this.title);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.black,
      radius: 120,
      child: CircleAvatar(
        radius: 110,
        backgroundImage: NetworkImage(
            'https://qph.cf2.quoracdn.net/main-qimg-28adaa2634a9bd29e0e833ef377e1eef-lq'),
      ),
    );
  }
}
