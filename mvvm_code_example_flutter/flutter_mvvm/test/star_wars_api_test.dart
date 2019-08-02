import 'package:flutter_mvvm/models/character.dart';
import 'package:flutter_mvvm/models/film.dart';
import 'package:flutter_mvvm/models/planet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mvvm/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm/services/swapi_service.dart';

void main() {
  final IStarWarsApi svc = SwapiService();

  test(
    'Films GET request test',
    () async {
      expect(await svc.getFilms(), isInstanceOf<List<Film>>());
    },
  );

  test(
    'Characters GET request test',
    () async {
      expect(await svc.getCharacters(), isInstanceOf<List<Character>>());
    },
  );

  test(
    'Planets GET request test',
    () async {
      expect(await svc.getPlanets(), isInstanceOf<List<Planet>>());
    },
  );
}