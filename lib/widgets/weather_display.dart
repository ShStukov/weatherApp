import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'date_format.dart';

Widget weatherDisplay(
    var cityName, var icon, var temp, var condition, var wind, var humidity) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$cityName',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
      Text(
        DateFormat.yMMMMd().format(DateTime.now()),
        style: const TextStyle(fontSize: 18),
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https:$icon', scale: 0.6),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                '$temp °C',
                style: const TextStyle(fontSize: 35),
              ),
              Text(
                '$condition',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const FaIcon(FontAwesomeIcons.wind, size: 30),
              const SizedBox(height: 10),
              Text(
                '${(wind)!.round()} m/s',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const FaIcon(FontAwesomeIcons.droplet, size: 30),
              const SizedBox(height: 10),
              Text(
                '$humidity %',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget weatherListDisplay(var date, var icon, var temp, var wind, var humidity) {
  var formattedDate1 = DateTime.fromMillisecondsSinceEpoch(date! * 1000);
  return Container(
    height: 120,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: Color.fromARGB(255, 147, 189, 223),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                DateFormatForecast.getFormattedDate(formattedDate1),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child:
                      Image.network('https:$icon', scale: 0.8),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      '$temp °C',
                      style: const TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.wind, size: 30),
            const SizedBox(height: 10),
            Text(
              '${(wind)!.round()} m/s',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(width: 30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.droplet, size: 30),
            const SizedBox(height: 10),
            Text(
              '$humidity %',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    ),
  );
}
