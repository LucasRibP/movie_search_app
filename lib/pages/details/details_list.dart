import 'package:flutter/material.dart';
import 'package:movie_search_app/data/movie_details.dart';

class DetailsList extends StatelessWidget {
  final MovieDetails details;
  const DetailsList({Key? key, required this.details}) : super(key: key);

  Widget _createTable() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: DataTable(columns: const [
        DataColumn(label: Text("Attribute")),
        DataColumn(label: Text("Value"))
      ], rows: [
        DataRow(cells: [
          const DataCell(Text("Rating")),
          DataCell(Text(details.rated))
        ]),
        DataRow(cells: [
          const DataCell(Text("Release Date")),
          DataCell(Text(details.released))
        ]),
        DataRow(cells: [
          const DataCell(Text("Runtime")),
          DataCell(Text(details.runtime))
        ]),
        DataRow(cells: [
          const DataCell(Text("Genres")),
          DataCell(Text(details.genre))
        ]),
        DataRow(cells: [
          const DataCell(Text("Awards")),
          DataCell(Text(details.awards))
        ]),
        DataRow(cells: [
          const DataCell(Text("Directors")),
          DataCell(Text(details.director))
        ]),
        DataRow(cells: [
          const DataCell(Text("Writers")),
          DataCell(Text(details.writer))
        ]),
        DataRow(cells: [
          const DataCell(Text("Actors")),
          DataCell(Text(details.actors))
        ]),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width > 1000) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: _createTable(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(details.plot),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(details.plot),
          ),
          _createTable()
        ],
      );
    }
  }
}
