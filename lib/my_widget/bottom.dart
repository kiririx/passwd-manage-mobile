import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

import '../route/page_router.dart';

var r1 = routeHome();
var r2 = routePersonalCenter();



bottomBar(BuildContext context, {required ThemeGlobal globalTheme}) {
  return BottomAppBar(
    color: globalTheme.bottomColor,
    shape: const CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              r1,
            );
          },
        ),
        const SizedBox(),
        IconButton(
          icon: const Icon(Icons.add_chart_rounded),
          onPressed: () {
            // Navigator.replace(context, newRoute: routePersonalCenter(), oldRoute: routeHome());
            Navigator.pushReplacement(
              context,
              r2,
            );
          },
        ),
      ],
    ),
  );
}
