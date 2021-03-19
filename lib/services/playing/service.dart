

class Event<T> {

  T _item;

  Event(this._item);

  T get item {
    return _item;
  }

}

class SnapshotEvent<GameSnapshot> extends Event {
  SnapshotEvent(item) : super(item);
}



abstract class AbstractPlayingService {

  Stream<Event> onEvent();

}
