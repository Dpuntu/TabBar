import 'package:flutter/material.dart';
import 'package:z_ui/tabs.dart';

const List<String> _titleList = ['test 1', 'test 2', 'test 3', 'test 4'];

class DataScreen extends StatelessWidget {
  static const String routeName = '/data/data_screen';

  const DataScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataPresentation();
  }
}

class DataPresentation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataScreenState();
  }
}

class _DataScreenState extends State<DataPresentation>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _titleList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TabBar')),
        body: _buildDataScreenBody(context));
  }

  Widget _buildDataScreenBody(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          color: Colors.blueAccent,
          width: double.infinity,
          child: Align(
              alignment: Alignment.center,
              child: H_TabBar(
                  controller: _tabController,
                  indicatorSize: H_TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                  indicatorWeight: 2.0,
                  isScrollable: true,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 16.0),
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  unselectedLabelStyle: TextStyle(fontSize: 12.0),
                  tabs: _titleList.map((text) => H_Tab(text: text)).toList()))),
      Expanded(
          child: H_TabBarView(
              controller: _tabController,
              children: [Test1(), Test2(), Test3(), Test4()]))
    ]);
  }
}

class Test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: Text('Test1'));
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: Text('Test2'));
  }
}

class Test3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow, child: Text('Test3'));
  }
}

class Test4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purple, child: Text('Test4'));
  }
}
