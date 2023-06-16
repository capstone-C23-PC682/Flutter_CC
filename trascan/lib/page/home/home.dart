// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:trascan/models/profil/list_profil.dart';
import 'package:trascan/page/akun/profile.dart';
import 'package:trascan/page/home/route.dart';
import 'package:trascan/page/widgets/constanta.dart';
import 'package:trascan/page/widgets/finite_state.dart';
import 'package:trascan/page/widgets/textIconMenu.dart';
import 'package:trascan/service/providers/profil/profil_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int activePage = 1;
  Dataprofil? datas;
  late Future<dynamic> profile;
  bool isDataLoaded = false; // Variable to check if the data is already loaded

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: activePage);

    // Fetch the profile data only if it's not loaded before
    if (!isDataLoaded) {
      final profilProvider =
          Provider.of<ProfilProvider>(context, listen: false);
      profile = profilProvider.fetchProfil();
      isDataLoaded = true;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // The didChangeDependencies method is called when the dependencies of the widget change,
  // such as when the provider data is updated
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Fetch the profile data only if it's not loaded before
    if (!isDataLoaded) {
      final profilProvider =
          Provider.of<ProfilProvider>(context, listen: false);
      profile = profilProvider.fetchProfil();
      isDataLoaded = true;
    }
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.only(bottom: 3, left: 3, right: 3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? primaryColor : offIndikartor,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightt = MediaQuery.of(context).size.height;
    double widthh = MediaQuery.of(context).size.width;
    final profilProvider = Provider.of<ProfilProvider>(context);
    final loading = profilProvider.myState == MyState.loading;
    final loaded = profilProvider.myState == MyState.loaded;
    final fail = profilProvider.myState == MyState.failed;
    datas = profilProvider.profil;

    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : fail || datas == null
            ? const Center(
                child: Text("Saat ini anda sedang dalam mode offline"),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                    margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: heightt * .01,
                          ),
                          Center(
                            child: SizedBox(
                              width: widthh * .9,
                              height: heightt * .4,
                              child: Image.asset(
                                'assets/trash.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: widthh * .03, left: widthh * .03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                pilihanMenu(
                                    data: datas!,
                                    judul: "Scan Sampahmu",
                                    icon: "assets/scan.png",
                                    number: 1,
                                    width: widthh,
                                    height: heightt),
                                pilihanMenu(
                                    data: datas!,
                                    judul: "History",
                                    icon: "assets/icon/jam.png",
                                    number: 2,
                                    width: widthh,
                                    height: heightt)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: heightt * .03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: widthh * .03, left: widthh * .03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                pilihanMenu(
                                    data: datas!,
                                    judul: "Collection",
                                    icon: "assets/icon/more.png",
                                    number: 3,
                                    width: widthh,
                                    height: heightt),
                                pilihanMenu(
                                    data: datas!,
                                    judul: "Profile",
                                    icon: "assets/icon/orang.png",
                                    number: 4,
                                    width: widthh,
                                    height: heightt)
                              ],
                            ),
                          ),
                        ])));
  }

  Widget pilihanMenu({
    required Dataprofil data,
    required String judul,
    required String icon,
    required int number,
    required var width,
    required var height,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => RouteDart(
                    numbers: number,
                    data: data,
                  )),
        );
      },
      child: Container(
        width: width * .38,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF43A047)),
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.01), BlendMode.multiply),
              child: Image.asset(
                icon,
                width: width * .2,
                height: number != 1 ? height * .13 : height * .15,
                color: const Color(0xFF43A047),
              ),
            ),
            number != 1
                ? SizedBox(
                    height: height * .02,
                  )
                : const SizedBox(),
            Text(judul,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF43A047)))
          ],
        ),
      ),
    );
  }
}
