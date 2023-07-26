import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/providers/cards_provider.dart';

class CardSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar archetype';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<CardsProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQueryCartas(query);

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Cartas>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final cartas = snapshot.data!;

        return ListView.builder(
            itemCount: cartas.length,
            itemBuilder: (_, int index) => _CartasItem(cartas[index]));
      },
    );
  }

  Widget _emptyContainer() {
    return Container(
      child: Center(
        child: Icon(
          Icons.search,
          color: Colors.black38,
          size: 130,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<CardsProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQueryCartas(query);

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Cartas>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final cartas = snapshot.data!;

        return ListView.builder(
            itemCount: cartas.length,
            itemBuilder: (_, int index) => _CartasItem(cartas[index]));
      },
    );
  }
}

class _CartasItem extends StatelessWidget {
  final Cartas card;

  const _CartasItem(this.card);

  @override
  Widget build(BuildContext context) {
    String heroId = 'search-${card.id}';

    return ListTile(
      leading: Hero(
        tag: heroId,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage(card.cardImages[0].imageUrl),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(card.name),
      subtitle: Text(card.archetype!),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: card);
      },
    );
  }
}
