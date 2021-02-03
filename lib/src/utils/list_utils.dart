class ListUtils {
  static List<E> shortList<E> (bool match(E currentElement, E nextElement), List<E> list) {
    List<E> tl = List.from(list); //Temporal list
    final lengthList = tl.length;
    for(int i = 1; i < lengthList; i ++) {
      for(int j = 0; j < lengthList - i; j++) {
        if(match(tl[j], tl[j + 1])) {
          final cv = tl[j];
          tl[j] = tl[j+ 1];
          tl[j + 1] = cv;
        }
      }
    }
    return tl;
  }

  static List<E> filterList<E>(bool match(E element), List list) {
    List<E> tl = List<E>(); //Temporal list
    for(E item in list) {
      if(match(item)) tl.add(item);
    }
    return tl;
  }

  static E findElement<E>(bool match(E element), List list) {
    for (E item in list) {
      if(match(item)) return item;
    }
    return null;
  }
}

