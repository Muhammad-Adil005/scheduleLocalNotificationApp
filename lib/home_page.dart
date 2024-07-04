import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:shedule_local_notification_app/Services/notifi_service.dart';

DateTime scheduleTime = DateTime.now();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Local Notifications'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DatePickerTxt(),
            ScheduleBtn(),
          ],
        ),
      ),
    );
  }
}

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    super.key,
  });

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (date) => setState(() => scheduleTime = date),
          onConfirm: (date) {
            setState(() => scheduleTime = date);
            debugPrint('Date selected: $date');
          },
        );
      },
      child: const Text(
        'Select Date Time',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Schedule notifications'),
      // onPressed: () async {
      //   debugPrint('Notification Scheduled for $scheduleTime');
      //   NotificationService().scheduleNotification(
      //       title: 'Scheduled Notification',
      //       body: '$scheduleTime',
      //       scheduledNotificationDateTime: scheduleTime);
      // });
      onPressed: () {
        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationHelper.scheduleNotification(
          'Scheduled',
          'This is Scheduled notifications',
          scheduleTime,
        );
      },
    );
  }
}
