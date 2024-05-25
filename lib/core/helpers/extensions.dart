import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// It makes it easy for you in the navigator 
//This is done through the buildcontext that is in all your project that shortens for you by saying context.pop or context.push
//These are the 4 main functions that are used in any project
extension Navigation on BuildContext {
  
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
