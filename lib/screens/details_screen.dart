import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cartas cartas = ModalRoute.of(context)!.settings.arguments as Cartas;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(cartas),
          SliverToBoxAdapter(
            child: _PosterAndTitle(cartas),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Cartas cartas;

  const _CustomAppBar(this.cartas);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            cartas.name,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          // ignore: unnecessary_null_comparison
          image: NetworkImage(cartas.cardImages[0].imageUrlCropped == null
              ? cartas.cardImages[0].imageUrl
              : cartas.cardImages[0].imageUrlCropped),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Cartas cartas;

  const _PosterAndTitle(this.cartas);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    double availableWidth = size.width;

    double imageWidth = availableWidth * 0.4;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinear al inicio
          children: [
            Expanded(
              child: Column(
                children: [
                  Hero(
                    tag: cartas.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'),
                        // ignore: unnecessary_null_comparison
                        image: NetworkImage(
                            // ignore: unnecessary_null_comparison
                            cartas.cardImages[0].imageUrlCropped == null
                                ? cartas.cardImages[0].imageUrl
                                : cartas.cardImages[0].imageUrlCropped),
                        height: 200,
                        width: imageWidth,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.red),
                              SizedBox(width: 10),
                              Text('Atk: ${cartas.atk ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.blue),
                              SizedBox(width: 10),
                              Text('Def: ${cartas.def ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.amber),
                              SizedBox(width: 10),
                              Text('Level: ${cartas.level ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              Text(
                                  'Atributo: ${cartas.attribute?.toString().split('.').last ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Arquetipo: ${cartas.archetype ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              // ignore: sdk_version_since
                              Text('Raza: ${cartas.race.name ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Escala: ${cartas.scale ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              // ignore: sdk_version_since
                              Text('Tipo: ${cartas.type.name ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                           Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              // ignore: sdk_version_since
                              Text('Amazon price: \$${cartas.cardPrices[0].amazonPrice ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                            Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              // ignore: sdk_version_since
                              Text('Ebay price: \$${cartas.cardPrices[0].ebayPrice ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                            Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              // ignore: sdk_version_since
                              Text('Market price: \$${cartas.cardPrices[0].cardmarketPrice ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                              Row(
                            children: [
                              Icon(Icons.star_outline,
                                  size: 15, color: Colors.grey),
                              SizedBox(width: 10),
                              // ignore: sdk_version_since
                              Text('TCG price: \$${cartas.cardPrices[0].tcgplayerPrice ?? "N/A"}',
                                  style: textTheme.bodyLarge),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartas.name,
                      style: textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Tooltip(
                      message: cartas.desc,
                      child: Text(
                        cartas.desc,
                        style: textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 50,
                      ),
                    ),
                    // Resto de detalles
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
