import 'package:flutter/material.dart';

import '../components/bottom_nav.dart';

class CurriculumVitae extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简历'),
      ),
      bottomNavigationBar: SelfBottomNav(index: 2),
      body: Text('简历'),
    );
  }
}
