import 'dart:ui';
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/iprogressing_service.dart';

class LocalNotificationProgressService implements IProgressingService {

  bool isActive = false;
  int progress = 0;
  String title = "In progress";
  String message = "...";

  static final LocalNotificationProgressService instance =
      new LocalNotificationProgressService();

  static LocalNotificationProgressService getInstance() {
    return instance;
  }

  initialize() {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Color(0xFF9D50DD),
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupkey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
  }

  requestPermission(){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  notify(){
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: "$title ($progress%)",
          body: message,
          category: NotificationCategory.Progress,
          notificationLayout: NotificationLayout.ProgressBar,
          progress: progress,
          locked: false
      )
    );
  }

  resetNotifier(){
    isActive = false;
    message = "...";
    title = "In progress";
    progress = 0;
    // AwesomeNotifications()
    //    .cancel(10);
  }

  @override
  Future onError() async {
    resetNotifier();
  }

  @override
  Future onFinished() async {
    resetNotifier();
  }

  @override
  Future onProgress(String message, int progress) async {
    this.progress = progress;
    this.message = message;
    isActive = true;
    notify();
  }

  @override
  Future onStart(String title) async {
    this.title = title;
    isActive = true;
    notify();
  }
}
