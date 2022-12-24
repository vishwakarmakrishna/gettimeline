import 'package:flutter/material.dart';
import 'package:gettimeline/model/timeline_model.dart';

class TimelineProvider extends ChangeNotifier {
  Set<MyTimeLineModel> timeline = {
    MyTimeLineModel(label: 'Title 1'),
    MyTimeLineModel(label: 'Title 2'),
    MyTimeLineModel(label: 'Title 3'),
    MyTimeLineModel(label: 'Title 4'),
  };

  void updateAllColor() {
    timeline = timeline
        .map((e) => MyTimeLineModel(
              label: e.label,
              color: e.title != null && e.title!.isNotEmpty
                  ? Colors.green
                  : e.title == null
                      ? Colors.grey
                      : Colors.red,
              title: e.title,
            ))
        .toSet();
    notifyListeners();
  }

  void updateTitle(int index, String? title) {
    timeline.elementAt(index).title = title;

    notifyListeners();
  }
}
