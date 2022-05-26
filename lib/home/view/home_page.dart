import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AutoTabsScaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBarBuilder: (context, tabsRouter) => AppBar(
          leading: const AutoBackButton(),
        ),
        routes: const [
          CalendarRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              label: 'Calendar',
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: (int? index) {},
        ),
      ),
    );
  }
}
