import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final String posterUrl;
  final String title;
  final String year;

  const DetailsHeader(
      {Key? key,
      required this.posterUrl,
      required this.title,
      required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.network(
            posterUrl,
            errorBuilder: ((context, error, stackTrace) => Container()),
          ),
        ),
        const Divider(),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(year)
      ],
    );
  }
}
