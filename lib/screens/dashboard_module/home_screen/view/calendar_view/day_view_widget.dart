import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../event_details_page.dart';

class DayViewWidget extends StatelessWidget {
  final GlobalKey<DayViewState>? state;
  final double? width;

  const DayViewWidget({
    super.key,
    this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DayView(
      key: state,
      width: width,
      headerStyle: HeaderStyle(
        leftIconPadding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(color: Colors.white),
        headerMargin: EdgeInsets.zero,
        leftIcon: Icon(Icons.arrow_back_ios),
        rightIcon: Expanded(
          child: Row(
            children: [
              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 50),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue) // Rounded corners
                      ),
                  child: Text(
                    "Today",
                    style: TextStyle(color: Colors.blue), // Text color
                  ),
                ),
              ),
              SizedBox(width: 10), // G
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
      startDuration: Duration(hours: 8),
      showHalfHours: true,
      heightPerMinute: 3,
      timeLineBuilder: _timeLineBuilder,
      verticalLineOffset: 0,
      showVerticalLine: false,
      hourIndicatorSettings: HourIndicatorSettings(
        offset: 0,
        color: Theme.of(context).dividerColor,
        lineStyle: LineStyle.dashed,
      ),
      onEventTap: (events, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: events.first,
            ),
          ),
        );
      },
      halfHourIndicatorSettings: HourIndicatorSettings(
        color: Theme.of(context).dividerColor,
        lineStyle: LineStyle.dashed,
      ),
      timeLineWidth: 80,
      showLiveTimeLineInAllDays: false,
      // eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
      //   return Text("hello");
      // },
      liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
        color: Colors.redAccent,
        showBullet: false,
        showTime: true,
        showTimeBackgroundView: false,
      ),
    );
  }

  Widget _timeLineBuilder(DateTime date) {
    if (date.minute != 0) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -8,
            right: 8,
            child: Text(
              date.hour < 10 ? "0${date.hour}:${date.minute}" : "${date.hour}:${date.minute}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.blueAccent.withAlpha(100),
                fontSize: 23,
              ),
            ),
          ),
        ],
      );
    }

    final hour = ((date.hour - 1) % 12) + 1;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -8,
          right: 8,
          child: Text(
            date.hour < 10 ? "0${date.hour}:00" : "${date.hour}:00",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.blueAccent.withAlpha(100),
              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}
