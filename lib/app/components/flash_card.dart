import 'package:english_card/app/pages/home/home_presenter.dart';
import 'package:english_card/app/pages/home/home_view.dart';
import 'package:english_card/app/utils/app_dimens.dart';
import 'package:english_card/data/models/vocabulary_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../utils/app_paths.dart';

class FlashCard extends StatefulWidget {
  VocabularyLocal vocab;

  FlashCard({Key? key, required this.vocab}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> implements HomeView {
  late HomePresenter presenter;

  @override
  void initState() {
    presenter = HomePresenter();
    presenter.attachView(this);
    super.initState();
  }

  @override
  void dispose() {
    presenter.deAttachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.getBackgroundFromCategory(widget.vocab.category!),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppPaths.icLove,
                  color: AppColors.colorWhite,
                  height: 40,
                  width: 40,
                ),
                GestureDetector(
                  onTap: () =>
                      presenter.playAudio(widget.vocab.audio.toString()),
                  child: SvgPicture.asset(
                    AppPaths.icAudio,
                    color: widget.vocab.audio.toString().isNotEmpty ? AppColors.colorWhite: AppColors.colorWhite30,
                    height: 40,
                    width: 40,
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.vocab.category!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(widget.vocab.word!,
                      style: Theme.of(context).textTheme.headline1),
                  Text(
                    widget.vocab.phonetic.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    width: AppDimens.getWidthDevice(context) * 0.7,
                    child: Center(
                      child: Text(
                        widget.vocab.example ?? '',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  @override
  void onGetVocabularyFromRemote(Future<List<VocabularyLocal>> vocabs) {}

  @override
  void onMoveToFavourite(int result) {}

  @override
  void onMoveToHistory(int result) {}

  @override
  void onPlayAudio() {
    setState(() {});
  }

  @override
  void onGetHistory(Future<List<VocabularyLocal>> recentVocabs) {}
}
