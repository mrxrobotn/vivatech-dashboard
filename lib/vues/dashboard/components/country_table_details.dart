import 'package:flutter/material.dart';

import '../../../functions.dart';
import 'custom_loader.dart';

class CountryNumberDetails extends StatelessWidget {
  CountryNumberDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: StreamBuilder<Map<String, int>>(
        stream: getCountryCountsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomLoader();
          }
          // Create the data rows for the DataTable
          final List<DataRow> dataRows = mergedCountryCounts.entries.map((entry) {
            final country = entry.key;
            final count = entry.value;

            return DataRow(
              cells: [
                DataCell(Text(country)),
                DataCell(Text(count.toString())),
              ],
            );
          }).toList();
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Pays', style: TextStyle(fontWeight: FontWeight.bold))
                  ),
                  DataColumn(
                      label: Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold))
                  ),
                ],
                rows: dataRows,
              ),
            );
        },
      ),
    );
  }
}
