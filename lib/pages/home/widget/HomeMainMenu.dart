import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/pages/home/widget/CardHomePage.dart';

class HomeMainMenu extends StatelessWidget {
  const HomeMainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CardHomePage(
              title: 'Test Page 1',
              push: '/test_page_1',
            ),
            CardHomePage(
              title: 'Test Page 2',
              push: '/test_page_2',
            ),
          ],
        ),
        Row(
          children: [
            CardHomePage(
              title: 'Test Page 3',
              push: '/test_page_3',
            ),
            CardHomePage(
              title: 'Test Page 4',
              push: '/test_page_4',
            ),
          ],
        ),
      ],
    );
  }
}
