import 'package:example/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Data> futureData;
  bool isApiLoded = false;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Data>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'API DATA BELOW',
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  snapshot.data!.profilePic.toString(),
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  snapshot.data!.name,
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Error Below',
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  '${snapshot.error}',
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(
                  snapshot.data!.emailId.toString(),
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  snapshot.data!.profilePic.toString(),
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Error Below',
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
                Text(
                  '${snapshot.error}',
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30,
                  ),
                ),
              ],
            );
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
