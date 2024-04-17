import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/models/assessment.dart';

import 'package:flutterapp/models/group_member.dart';
import 'details.dart';

class SummaryScreen extends StatefulWidget {
  final GroupMember _evaluator;
  final List _data;

  const SummaryScreen(this._evaluator, this._data, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  void _navigate(index) async {
    final returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          Assessment.copy(widget._data[index]),
        ),
      ),
    );

    if (returnData != null) {
      setState(() => widget._data[index] = returnData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const Text(
              'Peer and Self Assessement by',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              widget._evaluator.fullName,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),


      body: ListView.separated(
        itemCount: widget._data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(widget._data[index].member.shortName),
          subtitle: Text(widget._data[index].member.fullName),
          trailing: CircleAvatar(
            backgroundColor:
                widget._data[index].percent < 50 ? Colors.red : Colors.green,
            child: Text(
              widget._data[index].percent.round().toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => _navigate(index),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
