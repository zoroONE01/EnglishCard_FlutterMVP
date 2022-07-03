import 'dart:core';

import 'package:english_card/app/pages/home/home_presenter.dart';
import 'package:english_card/app/pages/home/home_view.dart';
import 'package:english_card/app/utils/app_colors.dart';
import 'package:english_card/app/utils/app_paths.dart';
import 'package:english_card/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/vocabulary_local.dart';

class ItemHistory extends StatefulWidget {
  VocabularyLocal vocab;

  ItemHistory({required this.vocab, super.key});

  @override
  State<ItemHistory> createState() => _ItemHistoryState();
}

class _ItemHistoryState extends State<ItemHistory> implements HomeView {
  late HomePresenter presenter;
  var contentsWidth = 200.0;

  @override
  void initState() {
    presenter = HomePresenter();
    presenter.attachView(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              gradient:
                  AppColors.getBackgroundFromCategory(widget.vocab.category!),
              shape: BoxShape.circle),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              AppStrings.getAcronymCategory(widget.vocab.category!),
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    widget.vocab.word!,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.vocab.phonetic.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Text(
                widget.vocab.example ?? '',
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 2,
              )
            ],
          ),
        ),
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: () => presenter.playAudio(widget.vocab.audio.toString()),
          child: SvgPicture.asset(
            AppPaths.icAudio,
            color: widget.vocab.audio.toString().isNotEmpty ? AppColors.colorWhite: AppColors.colorWhite30,
            height: 40,
            width: 40,
          ),
        )
      ]),
    );
  }

  @override
  void onGetHistory(Future<List<VocabularyLocal>> recentVocabs) {
    // TODO: implement onGetHistory
  }

  @override
  void onGetVocabularyFromRemote(Future<List<VocabularyLocal>> vocabs) {
    // TODO: implement onGetVocabularyFromRemote
  }

  @override
  void onMoveToFavourite(int result) {
    // TODO: implement onMoveToFavourite
  }

  @override
  void onMoveToHistory(int result) {
    // TODO: implement onMoveToHistory
  }

  @override
  void onPlayAudio() {
    setState(() {});
  }

  @override
  void dispose() {
    presenter.deAttachView();
    super.dispose();
  }
}
