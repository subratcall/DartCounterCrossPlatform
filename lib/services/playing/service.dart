class Event<T> {
  T _item;

  Event(this._item);

  T get item {
    return _item;
  }
}

abstract class AbstractPlayingService {
  Stream<Event> onEvent();
}
