import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/utils/app_fonts.dart';
import '../../../../data/provider/key_provider/key_provider.dart';
import 'event_details_page.dart';

typedef StringCallback = void Function(String);

class DayViewWidget extends StatelessWidget {
  final StringCallback onPressed;
  final GlobalKey<DayViewState>? state;
  final double? width;

  const DayViewWidget({
    super.key,
    required this.onPressed,
    this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DayView(
      onPageChange: (date, index) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
        print("date is $date");
        print("index is $index");
        onPressed(formattedDate);
      },
      initialDay: DateTime.now(),
      dayTitleBuilder: (date) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      NavigatorKey.instance.calendarKey.currentState?.previousPage();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        // Open date picker when the date text is tapped
                        await _selectDate(context, NavigatorKey.instance.calendarKey.currentState!.currentDate);
                      },
                      child: Text(_formatCustomDate(NavigatorKey.instance.calendarKey.currentState!.currentDate))),
                  GestureDetector(
                    onTap: () {
                      NavigatorKey.instance.calendarKey.currentState?.nextPage();
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  Spacer(),
                  // SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue) // Rounded corners
                          ),
                      child: Text(
                        "Today",
                        style: AppFonts.regular(15, AppColors.textDarkGray), // Text color
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // G
                  ClipOval(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                      // decoration: BoxDecoration(
                      //   color: Colors.blue,
                      //   shape: BoxShape.circle,
                      // ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      key: NavigatorKey.instance.calendarKey,
      width: width,
      headerStyle: HeaderStyle(
        titleAlign: TextAlign.left,
        leftIconPadding: EdgeInsets.only(left: 0),
        rightIconPadding: EdgeInsets.only(right: 160),
        decoration: BoxDecoration(color: Colors.white),
        headerMargin: EdgeInsets.zero,
        leftIcon: Icon(Icons.arrow_back_ios),
        rightIcon: Expanded(
          child: Row(
            children: [
              Icon(
                Icons.arrow_forward_ios,
              ),
              Spacer(),
              // SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  print("state is ${NavigatorKey.instance.calendarKey.currentState}");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue) // Rounded corners
                      ),
                  child: Text(
                    "Today",
                    style: AppFonts.regular(15, AppColors.textDarkGray), // Text color
                  ),
                ),
              ),
              SizedBox(width: 10), // G
              ClipOval(
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                  // decoration: BoxDecoration(
                  //   color: Colors.blue,
                  //   shape: BoxShape.circle,
                  // ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
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
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => DetailsPage(
        //       event: events.first,
        //     ),
        //   ),
        // );
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
                fontSize: 15,
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
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != currentDate) {
      NavigatorKey.instance.calendarKey.currentState?.jumpToDate(picked);
    }
  }

  String _formatCustomDate(DateTime date) {
    // Arrays for day and month names
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];

    // Format day with leading zero
    final day = date.day.toString().padLeft(2, '0');

    return '${days[date.weekday - 1]}, $day ${months[date.month - 1]} ${date.year}';
  }
}
