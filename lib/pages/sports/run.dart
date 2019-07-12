import 'package:flutter/material.dart';

class SportsRunPage extends StatefulWidget {
  @override
  createState() => _SportsRunPageState();
}

class _SportsRunPageState extends State with AutomaticKeepAliveClientMixin {

  int count = 0;

  @override
  void initState() {
    super.initState();
    print('--------异步实例化--------');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('runnding $count'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() { count = count + 1; }),
        child: Icon(Icons.add),
      ),
    );
  }
}
