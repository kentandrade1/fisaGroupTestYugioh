import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas/models/models.dart';

class CardSwiperCards extends StatelessWidget {
  final List<Cartas> cards;

  const CardSwiperCards({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.cards.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.65,
      child: Swiper(
        itemCount: cards.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.6,
        itemBuilder: (context, index) {
          final card = cards[index];
          String heroId = 'swiper-${card.id}';

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: card),
            child: Hero(
              tag: heroId,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber,
                      blurRadius: 40.0,
                      spreadRadius: -8.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                  gradient: RadialGradient(
                    colors: [Colors.amber, Colors.amber, Colors.amber],
                    stops: [1, 1, 1.0],
                    center: Alignment(0, 0),
                    focal: Alignment(0, 0),
                    focalRadius: 1.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(card.cardImages[0].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
