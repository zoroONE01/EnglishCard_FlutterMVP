import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_card/app/components/flash_card.dart';
import 'package:english_card/app/components/item_history.dart';
import 'package:english_card/app/pages/home/home_presenter.dart';
import 'package:english_card/app/pages/home/home_view.dart';
import 'package:english_card/app/utils/app_colors.dart';
import 'package:english_card/data/models/vocabulary_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_dimens.dart';
import '../../utils/app_paths.dart';
import '../../utils/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum WordCategory {
  noun,
  pronoun,
  adjective,
  verb,
  adverb,
  determiner,
  preposition,
  conjunction,
  interjection
}

class _HomePageState extends State<HomePage> implements HomeView {
  late CarouselController carouselController;
  late HomePresenter homePresenter;
  late Future<List<VocabularyLocal>> vocabularies;
  late Future<List<VocabularyLocal>> recentVocabs;

  _HomePageState() {
    homePresenter = HomePresenter();
    homePresenter.attachView(this);
  }

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
    homePresenter.getVocabularyFromRemote();
    homePresenter.findTopWordByAmount();
  }

  @override
  void dispose() {
    super.dispose();
    homePresenter.deAttachView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppDimens.heightToolbar,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                homePresenter.getVocabularyFromRemote();
                homePresenter.findTopWordByAmount();
              },
              icon: SvgPicture.asset(
                AppPaths.icRefresh,
                color: AppColors.colorWhite,
                width: AppDimens.sizeIconNormal,
                height: AppDimens.sizeIconNormal,
              ),
            ),
          )
        ],
        title: const Text(AppStrings.englishCard),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: -100,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    color: AppColors.colorPacificBlue30,
                    shape: BoxShape.circle),
              ),
            ),
          ),
          // vocabularyCards.isNotEmpty
          FutureBuilder<List<VocabularyLocal>>(
            future: vocabularies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: AppDimens.getHeightDevice(context) * 0.3,
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return SizedBox(
                    height: AppDimens.getHeightDevice(context) * 0.3,
                    child: const Align(
                        alignment: Alignment.center, child: Text('Error')),
                  );
                } else if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return FlashCard(vocab: snapshot.data![itemIndex]);
                    },
                    options: CarouselOptions(
                      height: AppDimens.getHeightDevice(context) * 0.3,
                      enlargeCenterPage: true,
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          ),
          // : Text("No data"),
          SlidingUpPanel(
            renderPanelSheet: false,
            minHeight: AppDimens.getHeightDevice(context) * 0.5,
            maxHeight: AppDimens.getHeightDevice(context),
            panel: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.colorWhite10,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: AppColors.colorWhite30, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: AppColors.colorWhite30),
                      height: 5,
                      width: AppDimens.getWidthDevice(context) * 0.3,
                    ),
                    FutureBuilder<List<VocabularyLocal>>(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Text('error');
                          } else if (snapshot.hasData) {
                            List<VocabularyLocal>? data = snapshot.data;
                            return SizedBox(
                              height: AppDimens.getHeightDevice(context) * 0.8,
                              child: ListView.builder(
                                shrinkWrap: true, // Set this
                                itemBuilder: (context, index) =>
                                    ItemHistory(vocab: data![index]),
                                itemCount: data?.length,
                              ),
                            );
                          } else {
                            return const Text('Empty data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      },
                      future: recentVocabs,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onMoveToFavourite(int result) {}

  @override
  void onMoveToHistory(int result) {}

  @override
  void onGetVocabularyFromRemote(
    Future<List<VocabularyLocal>> vocabularies,
  ) {
    setState(() {
      this.vocabularies = vocabularies;
    });
  }

  @override
  void onPlayAudio() {}

  @override
  void onGetHistory(Future<List<VocabularyLocal>> recentVocabs) {
    setState(() {
      this.recentVocabs = recentVocabs;
    });
  }
}
