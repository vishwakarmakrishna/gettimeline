import 'package:flutter/material.dart';
import 'package:gettimeline/model/timeline_model.dart';

class TimelineProvider extends ChangeNotifier {
  Set<MyTimeLineModel> _timeline = {
    MyTimeLineModel(label: 'Title 1'),
    MyTimeLineModel(label: 'Title 2'),
    MyTimeLineModel(label: 'Title 3'),
    MyTimeLineModel(label: 'Title 4'),
  };

  Set<MyTimeLineModel> get timeline => _timeline;
  set timeline(Set<MyTimeLineModel> value) {
    _timeline = value;
    notifyListeners();
  }

  MyTimeLineModel _getTimeline(MyTimeLineModel e, Color c) =>
      MyTimeLineModel(label: e.label, color: c, title: e.title);
  void updateAllColor() {
    timeline = _timeline
        .map((e) => e.title != null && e.title!.isNotEmpty
            ? _getTimeline(e, Colors.green)
            : e.title == null
                ? _getTimeline(e, Colors.grey)
                : _getTimeline(e, Colors.red))
        .toSet();
  }

  void updateTitle(int index, String? title) {
    _timeline.elementAt(index).title = title;

    notifyListeners();
  }
}
