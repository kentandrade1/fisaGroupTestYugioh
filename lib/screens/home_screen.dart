import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_slider_cards.dart';
import 'package:peliculas/widgets/card_swiper_card.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/cards_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<CardsProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroundyugi.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "YUGIOH CARDS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Gothic", // Aquí debes cargar la fuente gótica
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.search_outlined, color: Colors.white),
                    onPressed: () => showSearch(
                        context: context, delegate: CardSearchDelegate()),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Tarjetas principales
                    CardSwiperCards(cards: moviesProvider.onDisplayCard),

                    CardsSlider(
                      cartas: moviesProvider.arquetipCardDestinyHero,
                      title: 'Destiny Hero arquetipo',
                      onNextPage: () =>
                          moviesProvider.getArquitipCardDataDestinyHERO(),
                    ),
                    CardsSlider(
                      cartas: moviesProvider.arquetipCardCryston,
                      title: 'Crystron arquetipo',
                      onNextPage: () =>
                          moviesProvider.getArquitipCardDataCryston(),
                    ),
                    CardsSlider(
                      cartas: moviesProvider.arquetipCardSixSamurai,
                      title: 'Six Samurai arquetipo',
                      onNextPage: () =>
                          moviesProvider.getArquitipCardDataSixSamurai(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
