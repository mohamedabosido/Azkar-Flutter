import 'package:azkar/api/controller/api_timings_by_city_controller.dart';
import 'package:azkar/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({Key? key}) : super(key: key);

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  late Future<dynamic> _future;
  late dynamic data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = ApiTimingsByCityController()
        .getData(coName: 'Palestine', ciName: 'Gaza');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder<dynamic>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        purpleColor,
                        secondaryTextColor,
                      ],
                    ),
                  ),
                    child: Center(
                      child: Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_ptgox53w.json',
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                data = snapshot.data ?? {};
                return Scaffold(
                  backgroundColor: backgroundColor,
                  appBar: AppBar(
                    title: const Text(
                      'مواقيت الصلاة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    flexibleSpace: const Image(
                      image: AssetImage('images/back.png'),
                      fit: BoxFit.cover,
                    ),
                    elevation: 0,
                  ),
                  body: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            image: const DecorationImage(
                                image: AssetImage('images/back2.png'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.grey.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${DateTime.now().hour}:${DateTime.now().minute}',
                              style: const TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${data['date']['hijri']['weekday']['ar']}  ${data['date']['readable']}',
                              style: const TextStyle(
                                  color: purpleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${data['date']['hijri']['day']} ${data['date']['hijri']['month']['ar']} ${data['date']['hijri']['year']}',
                              style: const TextStyle(
                                  color: purpleColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'صلاة الفجر',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data['timings']['Fajr'],
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'صلاة الشروق',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data['timings']['Sunrise'],
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'صلاة الظهر',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data['timings']['Dhuhr'],
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'صلاة العصر',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data['timings']['Asr'],
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'صلاة المغرب',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data['timings']['Maghrib'],
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'صلاة العشاء',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data['timings']['Isha'],
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: const [
                      Icon(Icons.warning, size: 80),
                      Text(
                        'NO DATA',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
