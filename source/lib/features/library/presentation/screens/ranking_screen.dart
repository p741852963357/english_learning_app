import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';

@RoutePage()
class RankingScreen extends StatelessWidget {
  final String id;
  const RankingScreen({super.key, required this.id});

  Future _fetchNetworkCall() async {
    try {
      const endPoint = '/api/topics/ranking';
      final queryParameters = {'id': id};
      final response = await get(
        Uri.parse(
          URL + endPoint,
        ).replace(queryParameters: queryParameters),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data['data'];
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        centerTitle: true,
        title: const Text(
          "Ranking",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: _fetchNetworkCall(), // async work
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading....');
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  print(snapshot.data['ranking']);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shortest time",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              snapshot.data['ranking'][index]['user'].toString(),
                            ),
                            subtitle:
                                Text('${DateTime.parse(snapshot.data['ranking'][index]['end'].toString()).difference(DateTime.parse(snapshot.data['ranking'][index]['start'].toString())).inSeconds}s'),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: 5,
                      )
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
