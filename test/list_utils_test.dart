import 'package:flutter_test/flutter_test.dart';
import 'package:hr_management/src/utils/list_utils.dart';

void main() {
  group('List utils test', (){
    test('Short Asc', () {
      List<int> elements = [4,5,1,0,2];

      elements = ListUtils.shortList((currentElement, nextElement) => currentElement > nextElement, elements);

      expect(elements[0], 0);
      expect(elements[2], 2);
      expect(elements[4], 5);
    });

    test('Short Desc', () {
      List<int> elements = [4,5,1,2,-2,];

      elements = ListUtils.shortList((currentElement, nextElement) => currentElement < nextElement, elements);

      expect(elements[0], 5);
      expect(elements[2], 2);
      expect(elements[4], -2);
    });

    test('Filter by condition', () {
      List<int> elements = [4,5,1,0,2,3,5,3,0,2,0,2,3,0,];
      final numberMatch = 3;

      List<int> filterElements = ListUtils.filterList((element) => element == numberMatch, elements);

      expect(filterElements.length,3);
      expect(filterElements[0],3);
      expect(filterElements[2],3);

      final numberMatch2 = 300;
      List<int> filterElements2 = ListUtils.filterList((element) => element == numberMatch2, elements);

      expect(filterElements2.length,0);
    });

    test('Using different types of <T> ', () {
      expect(() {
        List<int> elements = [4,5,1,0,2,3,5,3,0,2,0,2,3,0,];
        final numberMatch = 3;
        List<double> filterElements = ListUtils.filterList((element) => element == numberMatch, elements);
      }, throwsA(isA<TypeError>()));
    });

    test('Find a element', () {
      List<int> elements = [4,5,1,0,2,3,5,3,0,2,0,2,3,0,];
      final numberMatch = 3;
      int result = ListUtils.findElement((element) => element == numberMatch, elements);
      expect(result, 3);

      final numberMatch2 = 300;
      int result2 = ListUtils.findElement((element) => element == numberMatch2, elements);
      expect(result2, null);
    });
  });
}