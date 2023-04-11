import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/color/color.dart';
import 'package:weather_app/core/size/size.dart';
import 'package:weather_app/services/geo_location.dart';
import 'package:weather_app/services/weatherdata.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  var client = WeatherData();
  var data;

  info() async {
    var position = await determinePosition();
    data = await client.getData(position.latitude, position.longitude);
    // data = await client.getData('9.935750', '76.317940');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: info(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.75,
                      width: size.width,
                      padding: const EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: kred,
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                            colors: [
                              kpurple,
                              kcyanBlue,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.2, 0.85]),
                      ),
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Expanded(
                          //         child: Padding(
                          //           padding:
                          //               const EdgeInsets.symmetric(horizontal: 8.0),
                          //           child: TextFormField(
                          //             decoration: const InputDecoration(
                          //               border: OutlineInputBorder(),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       CircleAvatar(
                          //         radius: 25,
                          //         backgroundColor: kpurple,
                          //         child: IconButton(
                          //           onPressed: () {},
                          //           icon: const Icon(Icons.search),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // kheight10,
                          Text(
                            '${data?.cityname}',
                            style: TextStyle(
                              color: kwhite.withOpacity(0.9),
                              fontSize: 35,
                              fontFamily: 'MavenPro',
                            ),
                          ),
                          kheight10,
                          Text(
                            dateFormat,
                            style: TextStyle(
                              color: kwhite.withOpacity(0.9),
                              fontSize: 15,
                              fontFamily: 'MavenPro',
                            ),
                          ),
                          kheight20,
                          Image.network(
                            'https:${data?.icon}',
                            width: size.width * 0.3,
                            fit: BoxFit.fill,
                          ),
                          kheight10,
                          Text(
                            '${data?.condition}',
                            style: const TextStyle(
                                color: kwhite,
                                fontSize: 45,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Hubballi'),
                          ),
                          kheight5,
                          Text(
                            '${data?.temp}°',
                            style: const TextStyle(
                                color: kwhite,
                                fontSize: 75,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Hubballi'),
                          ),
                          kheight20,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/storm.png',
                                        width: size.width * 0.15),
                                    Text(
                                      '${data.wind} km/h',
                                      style: const TextStyle(
                                        color: kwhite,
                                        fontFamily: 'Hubballi',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    kheight5,
                                    Text(
                                      'wind',
                                      style: TextStyle(
                                        color: kwhite.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/humidity.png',
                                        width: size.width * 0.15),
                                    Text(
                                      '${data.humidity}',
                                      style: const TextStyle(
                                        color: kwhite,
                                        fontFamily: 'Hubballi',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    kheight5,
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                        color: kwhite.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/wind_direction.png',
                                      width: size.width * 0.15,
                                    ),
                                    Text(
                                      '${data?.winddir}',
                                      style: const TextStyle(
                                        color: kwhite,
                                        fontFamily: 'Hubballi',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    kheight5,
                                    Text(
                                      'Wind Direction',
                                      style: TextStyle(
                                        color: kwhite.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    kheight50,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Gust',
                                style: TextStyle(
                                  color: kwhite.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                ),
                              ),
                              kheight5,
                              Text(
                                '${data?.gust} kp/h',
                                style: const TextStyle(
                                  color: kwhite,
                                  fontFamily: 'Hubballi',
                                  fontSize: 18,
                                ),
                              ),
                              kheight20,
                              Text(
                                'Pressure',
                                style: TextStyle(
                                  color: kwhite.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                ),
                              ),
                              kheight5,
                              Text(
                                '${data?.pressure} hpa',
                                style: const TextStyle(
                                  color: kwhite,
                                  fontFamily: 'Hubballi',
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'UV',
                                style: TextStyle(
                                  color: kwhite.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                ),
                              ),
                              kheight5,
                              Text(
                                '${data?.uv}',
                                style: const TextStyle(
                                  color: kwhite,
                                  fontFamily: 'Hubballi',
                                  fontSize: 18,
                                ),
                              ),
                              kheight20,
                              Text(
                                'Precipitation',
                                style: TextStyle(
                                  color: kwhite.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                ),
                              ),
                              kheight5,
                              Text(
                                '${data?.pricipe} mm',
                                style: const TextStyle(
                                  color: kwhite,
                                  fontFamily: 'Hubballi',
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                  color: kwhite.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                ),
                              ),
                              kheight5,
                              Text(
                                '${data?.wind} km/h',
                                style: const TextStyle(
                                  color: kwhite,
                                  fontFamily: 'Hubballi',
                                  fontSize: 18,
                                ),
                              ),
                              kheight20,
                              Text(
                                'Last Update',
                                style: TextStyle(
                                  color: kwhite.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                ),
                              ),
                              kheight5,
                              Text(
                                '${data?.lastupdate}',
                                style: const TextStyle(
                                  color: kgreen,
                                  fontFamily: 'Hubballi',
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                  child:
                      CircularProgressIndicator()); // or any other loading indicator
            }
          }),
    );
  }
}
