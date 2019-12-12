import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'passenger.dart';
import 'package:flutter/rendering.dart';

List<Passenger> _passengers = <Passenger>[
  Passenger(name:'Bobert Rickty',destination:'McDonalds',selected: false),
  Passenger(name:'Penelope Star',destination:'Walmart',selected: false),
  Passenger(name:'Jack Forest',destination:'A & W',selected: false),

];

class passengerlist extends StatefulWidget {
  @override
  PassList createState() => PassList();
}

class PassList extends State<passengerlist> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  void initState() {
    _items = _passengers;
    super.initState();
  }

  void _sort<T>(Comparable<T> getField(Passenger d), int columnIndex,
      bool ascending) {
    _items.sort((Passenger a, Passenger b) {
      if (!ascending) {
        Passenger c = a;
        a = b;
        b = c;
      }
      Comparable<T> aValue = getField(a);
      Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<Passenger> _items = [];
  int _rowsOffset = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Passenger List'),
        ),
        body: NativeDataTable.builder(
          rowsPerPage: _rowsPerPage,
          itemCount: _items.length,
          firstRowIndex: _rowsOffset,

          itemBuilder: (int index) {
            Passenger passenger = _items[index];
            return DataRow.byIndex(
                index: index,
                //selected: passenger.selected,
                onSelectChanged: (bool value) {
                      setState(() {
                      passenger.selected = value;
                      });
                },
                cells: <DataCell>[
                  DataCell(Text('${passenger.name}')),
                  DataCell(Text('${passenger.destination}')),
                ]);
          },
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,

          onRefresh: () async {
            setState(() {
              _items = _passengers;
            });
          },

          onSelectAll: (bool value) {
             for (var row in _items) {
              setState(() {
                row.selected = value;
              });
                }
          },

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                List<Passenger> toBeRemoved=<Passenger>[Passenger(name:'Dummy')];
                for (var item in _items){
                  if(item.selected == true){
                    toBeRemoved.add(item);
                  }
                }
                _passengers.removeWhere( (e) => toBeRemoved.contains(e));
                setState(() {
                  _items = _passengers;
                }
                );
              },
            ),
          ],
          columns: <DataColumn>[
            DataColumn(
                label: const Text('Name'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>(
                            (Passenger d) => d.name, columnIndex, ascending)),
            DataColumn(
                label: const Text('Destination'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>(
                            (Passenger d) => d.destination, columnIndex, ascending)),

          ],
        ),)
      ,
    );
  }


}