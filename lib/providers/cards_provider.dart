import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:peliculas/helpers/debouncer.dart';

import 'package:peliculas/models/models.dart';

class CardsProvider extends ChangeNotifier {
  List<Cartas> onDisplayCard = [];
  List<Cartas> arquetipCardDestinyHero = [];
  List<Cartas> arquetipCardCryston = [];
  List<Cartas> arquetipCardSixSamurai = [];

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Cartas>> _suggestionStreamContoller =
      new StreamController.broadcast();
  Stream<List<Cartas>> get suggestionStream =>
      this._suggestionStreamContoller.stream;

  CardsProvider() {
    this.getCards();

    this.getAllCardData();
    this.getArquitipCardDataDestinyHERO();
    this.getArquitipCardDataCryston();
    this.getArquitipCardDataSixSamurai();
  }

  getCards() async {
    await getAllCardData();

    await getArquitipCardDataCryston();
    // await  getArquitipCardDataSixSamurai();

    notifyListeners();
  }

  getAllCardData() async {
    final url = Uri.https('db.ygoprodeck.com', '/api/v7/cardinfo.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

// Verificar si jsonData['data'] es una lista antes de iterar

        if (jsonData['data'] is List<dynamic>) {
          // Iterar a través de los elementos de la lista jsonData['data']
          for (var item in jsonData['data']) {
            // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
            //print(item);

            if (item != null) {
              // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
              final carta = Cartas.fromMap(item);

              if (carta.banlistInfo != null) {
                bool shouldAddCard = true;

                if (carta.banlistInfo!.banOcg != null &&
                    carta.banlistInfo!.banOcg == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banGoat != null &&
                    carta.banlistInfo!.banGoat == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banTcg != null &&
                    carta.banlistInfo!.banTcg == "Banned") {
                  shouldAddCard = false;
                }

                if (shouldAddCard) {
                  // this.onDisplayCard.add(carta);
                }
              } else {
                this.onDisplayCard.add(carta);
                // No agregar a la lista si banlistInfo es nulo
              }
            }
          }
        }
      } else {
        throw Exception('Error al obtener los datos de la API');
      }
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }
  }

//https://db.ygoprodeck.com/api/v7/cardinfo.php?archetype=Blue-Eyes
  getArquitipCardDataSixSamurai() async {
    final String archetype = 'Six Samurai';
    final url = Uri.https(
        'db.ygoprodeck.com', '/api/v7/cardinfo.php', {'archetype': archetype});

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

// Verificar si jsonData['data'] es una lista antes de iterar

        if (jsonData['data'] is List<dynamic>) {
          // Iterar a través de los elementos de la lista jsonData['data']
          for (var item in jsonData['data']) {
            // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
            //print(item);

            if (item != null) {
              // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
              final carta = Cartas.fromMap(item);

              if (carta.banlistInfo != null) {
                bool shouldAddCard = true;

                if (carta.banlistInfo!.banOcg != null &&
                    carta.banlistInfo!.banOcg == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banGoat != null &&
                    carta.banlistInfo!.banGoat == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banTcg != null &&
                    carta.banlistInfo!.banTcg == "Banned") {
                  shouldAddCard = false;
                }

                if (shouldAddCard) {
                  // this.arquetipCardSixSamurai.add(carta);
                }
              } else {
                this.arquetipCardSixSamurai.add(carta);
                // No agregar a la lista si banlistInfo es nulo
              }
            }
          }
        }
      } else {
        throw Exception('Error al obtener los datos de la API');
      }
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }
  }

  getArquitipCardDataCryston() async {
    final String archetype = 'Crystron';
    final url = Uri.https(
        'db.ygoprodeck.com', '/api/v7/cardinfo.php', {'archetype': archetype});

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

// Verificar si jsonData['data'] es una lista antes de iterar

        if (jsonData['data'] is List<dynamic>) {
          // Iterar a través de los elementos de la lista jsonData['data']
          for (var item in jsonData['data']) {
            // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
            //print(item);

            if (item != null) {
              // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
              final carta = Cartas.fromMap(item);

              if (carta.banlistInfo != null) {
                bool shouldAddCard = true;

                if (carta.banlistInfo!.banOcg != null &&
                    carta.banlistInfo!.banOcg == "Banned") {
                  shouldAddCard = false;
                  print(carta.banlistInfo!.banOcg);
                }

                if (carta.banlistInfo!.banGoat != null &&
                    carta.banlistInfo!.banGoat == "Banned") {
                  shouldAddCard = false;
                  print(carta.banlistInfo!.banGoat);
                }

                if (carta.banlistInfo!.banTcg != null &&
                    carta.banlistInfo!.banTcg == "Banned") {
                  shouldAddCard = false;
                  print(carta.banlistInfo!.banTcg);
                }

                if (shouldAddCard) {
                  //this.arquetipCardCryston.add(carta);
                }
              } else {
                this.arquetipCardCryston.add(carta);
                // No agregar a la lista si banlistInfo es nulo
              }
            }
          }
        }
      } else {
        throw Exception('Error al obtener los datos de la API');
      }
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }
  }

  getArquitipCardDataDestinyHERO() async {
    final String archetype = 'Destiny HERO';
    final url = Uri.https(
        'db.ygoprodeck.com', '/api/v7/cardinfo.php', {'archetype': archetype});

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

// Verificar si jsonData['data'] es una lista antes de iterar

        if (jsonData['data'] is List<dynamic>) {
          // Iterar a través de los elementos de la lista jsonData['data']
          for (var item in jsonData['data']) {
            // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
            //print(item);

            if (item != null) {
              // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
              final carta = Cartas.fromMap(item);

              if (carta.banlistInfo != null) {
                bool shouldAddCard = true;

                if (carta.banlistInfo!.banOcg != null &&
                    carta.banlistInfo!.banOcg == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banGoat != null &&
                    carta.banlistInfo!.banGoat == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banTcg != null &&
                    carta.banlistInfo!.banTcg == "Banned") {
                  shouldAddCard = false;
                }

                if (shouldAddCard) {
                  //this.arquetipCardDestinyHero.add(carta);
                }
              } else {
                this.arquetipCardDestinyHero.add(carta);
                // No agregar a la lista si banlistInfo es nulo
              }
            }
          }
        }
      } else {
        throw Exception('Error al obtener los datos de la API');
      }
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }
  }

  Future<List<Cartas>> searchCartas(String query) async {
    List<Cartas> listCard = [];
    final url = Uri.https(
        'db.ygoprodeck.com', '/api/v7/cardinfo.php', {'archetype': query});

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData['data'] is List<dynamic>) {
          for (var item in jsonData['data']) {
            // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
            //print(item);

            if (item != null) {
              // Convertir cada elemento a una instancia de Cartas y agregarlo a la lista cartasList
              final carta = Cartas.fromMap(item);

              if (carta.banlistInfo != null) {
                bool shouldAddCard = true;

                if (carta.banlistInfo!.banOcg != null &&
                    carta.banlistInfo!.banOcg == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banGoat != null &&
                    carta.banlistInfo!.banGoat == "Banned") {
                  shouldAddCard = false;
                }

                if (carta.banlistInfo!.banTcg != null &&
                    carta.banlistInfo!.banTcg == "Banned") {
                  shouldAddCard = false;
                }

                if (shouldAddCard) {
                  //listCard.add(carta);
                }
              } else {
                listCard.add(carta);
                // No agregar a la lista si banlistInfo es nulo
              }
            }
          }
        }
      } else {
        throw Exception('Error al obtener los datos de la API');
      }
    } catch (e) {
      print('Error al obtener los datos de la API: $e');
    }

    return listCard;
  }

  void getSuggestionsByQueryCartas(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      // print('Tenemos valor a buscar: $value');
      final results = await this.searchCartas(value);
      this._suggestionStreamContoller.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
