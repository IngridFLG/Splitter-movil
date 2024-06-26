import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigatorProvider extends ChangeNotifier {
  TabProvider _tab = TabProvider(index: 1, page: 'tema-inicio-page');
  final List<TabProvider> _stackPage = [
    TabProvider(index: 1, page: 'tema-inicio-page')
  ];

  TabProvider get tab => _tab;

  set _setTab(TabProvider newTab) {
    _tab = newTab;
    _stackPage.add(_tab);
    notifyListeners();
  }

  void pop() {
    if (_stackPage.length > 1) {
      _stackPage.removeLast();
      _tab.page = _stackPage.last.page;
      _tab.index = _stackPage.last.index;
      notifyListeners();
    } else {
      SystemNavigator.pop();
    }
  }

  /// navegar desde el home
  void push({int? index, required String page}) {
    _setTab = TabProvider(index: index ?? _tab.index!, page: page);
  }

  /// navegar fuera del home
  void pushInterViews(BuildContext context, {required String page}) {
    Navigator.pushNamed(context, page);
  }

  ///Limpiar la pila
  void clear() {
    _stackPage.clear();
    notifyListeners();
  }

  ///Resetar la pila
  void reset() {
    _stackPage.clear();
    _setTab = TabProvider(index: 1, page: 'tema-inicio-page');
    notifyListeners();
  }
}

class TabProvider {
  int? index;
  String? page;

  TabProvider({
    this.index,
    this.page,
  });

  factory TabProvider.fromJson(Map<String, dynamic> json) => TabProvider(
        index: json["index"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "page": page,
      };
}
