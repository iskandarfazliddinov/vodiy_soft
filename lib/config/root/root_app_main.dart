import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootAppMain extends StatelessWidget {
  const RootAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
