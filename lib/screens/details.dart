import 'package:flutter/material.dart';
import 'package:flutterapp/models/assessment.dart';
import 'package:flutterapp/models/form.dart';

class DetailsScreen extends StatefulWidget {
  final Assessment _data;

  DetailsScreen(this._data);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope( //why ni use popscope and what is popscope
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(widget._data.member.shortName),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: criteria.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(criteria[index].title),
            subtitle: Text(criteria[index].description),
            trailing: DropdownButton<int>(
              value: widget._data.points[index],
              items: scales
                  .map(
                    (scale) => DropdownMenuItem(
                      value: scale.value,
                      child: Text(scale.title),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) =>
                  setState(() => widget._data.points[index] = newValue!),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              label: const Text('Save'),
              icon: const Icon(Icons.check_circle),
              heroTag: null,
              onPressed: () => Navigator.of(context).pop(widget._data),
            ),
            FloatingActionButton.extended(
              label: const Text('Cancel'),
              icon: const Icon(Icons.cancel),
              heroTag: null,
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
        ),
      ),
    );
  }
}
