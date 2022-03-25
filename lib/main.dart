
import 'package:flutter/material.dart';
import 'package:push_local_notification/api/notification_api.dart';
import 'package:push_local_notification/page/second_page.dart';
import 'card/buid_button.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LocalNotifications',
      home: MainPage(),
    );

  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() {
    NotificationApi.onNotifications.stream.listen(onClickedNotification);
  }
  void onClickedNotification(String ?payload) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SecondPage(payload: payload)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Spacer(),
            const FlutterLogo(size: 160,),
            const SizedBox(height: 24,),
            const Text('Local Notifications',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 48,),
            BuidButton(
              title: 'Simple Notification',
              onTap: (){
                NotificationApi.showNotification(
                  title: 'Trịnh Hưng',
                  body: 'Lớp 12B Trường trung học phổ thông Mai Anh Tuấn',
                  payload: 'Mai Nhung'
                );
              },
            ),
            const SizedBox(height: 24,),
            BuidButton(
              title: 'Scheduled Notification',
              onTap: (){
                // NotificationApi.showScheduledNotification(
                //     title: 'Dinner',
                //     body: 'Today at 6 PM',
                //     payload: 'dinner_6pm',
                //   scheduledDate: DateTime.now().add(Duration(seconds: 12))
                // );
                final snackBar=const SnackBar(content: Text(
                  'Schedulwd in 12 Seconds',
                  style: TextStyle(fontSize: 24),
                ),
                  backgroundColor:Colors.green ,
                );
                ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackBar);
              },
            ),
            const SizedBox(height: 24,),
            BuidButton(
              title: 'Remove Notifications',
              onTap: (){
                NotificationApi.showNotification(
                    title: 'Trịnh Hưng',
                    body: 'Lớp 12B Trường trung học phổ thông Mai Anh Tuấn',
                    payload: 'Mai Nhung'
                );
              },   )
          ],
        ),
      ),
    );
  }
}








