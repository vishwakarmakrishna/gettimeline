import 'package:flutter/material.dart';
import 'package:gettimeline/controller/timeline_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TimelineProvider>(builder: (context, consumer, child) {
        return ListView.separated(
          separatorBuilder: (context, i) => TimelineDivider(
            begin: 0.3,
            end: 0.7,
            thickness: 6,
            color: consumer.timeline.elementAt(i).color,
          ),
          itemCount: consumer.timeline.length,
          itemBuilder: (context, i) {
            var item = consumer.timeline.elementAt(i);
            if (i.isEven) {
              return TimelineTile(
                lineXY: 0.7,
                alignment: TimelineAlign.manual,
                isFirst: i == 0,
                isLast: i == (consumer.timeline.length - 1),
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: item.color,
                ),
                beforeLineStyle: LineStyle(
                  color: item.color,
                  thickness: 6,
                ),
                endChild: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: item.color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (i).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                startChild: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: item.label,
                      hintText: 'Enter a title',
                    ),
                    onChanged: (value) {
                      consumer.updateTitle(i, value);
                      consumer.updateAllColor();
                    },
                  ),
                ),
              );
            } else {
              return TimelineTile(
                lineXY: 0.3,
                alignment: TimelineAlign.manual,
                isFirst: i == 0,
                isLast: i == (consumer.timeline.length - 1),
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: item.color,
                ),
                beforeLineStyle: LineStyle(
                  color: item.color,
                  thickness: 6,
                ),
                startChild: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: item.color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (i).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                endChild: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: item.label,
                      hintText: 'Enter a title',
                    ),
                    onChanged: (value) {
                      consumer.updateTitle(i, value);
                      consumer.updateAllColor();
                    },
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
