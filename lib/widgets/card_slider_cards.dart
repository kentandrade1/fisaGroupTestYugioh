import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardsSlider extends StatefulWidget {
  final List<Cartas> cartas;
  final String? title;
  final Function onNextPage;

  const CardsSlider({
    Key? key,
    required this.cartas,
    required this.onNextPage,
    this.title,
  }) : super(key: key);

  @override
  _CardsSliderState createState() => _CardsSliderState();
}

class _CardsSliderState extends State<CardsSlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                this.widget.title!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.cartas.length,
                itemBuilder: (_, int index) => _MoviePoster(
                    widget.cartas[index],
                    '${widget.title}-$index-${widget.cartas[index].id}')),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Cartas carta;
  final String heroId;

  const _MoviePoster(this.carta, this.heroId);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: carta),
            child: Hero(
              tag: heroId,
              child: ClipRRect(
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(carta.cardImages[0].imageUrl),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            carta.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
