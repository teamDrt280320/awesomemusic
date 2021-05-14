import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:awesomemusic/widgets/seeker.dart';
import 'package:just_audio/just_audio.dart';

class AudioTask extends BackgroundAudioTask {
  var _player = AudioPlayer();
  AudioPlayer get player => _player;
  var queue = <MediaItem>[];
  AudioProcessingState? _skipState;
  late StreamSubscription<PlaybackEvent> _eventSubscription;
  int? get index => _player.currentIndex;
  Seeker? _seeker;
  MediaItem? get mediaItem => index == null ? null : queue[index!];
  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    for (var item in (params!['queue'] as List<dynamic>)) {
      var mediaItem = MediaItem.fromJson(Map<String, dynamic>.from(item));
      queue.add(mediaItem);
    }
    _player.currentIndexStream.listen((index) {
      if (index != null) AudioServiceBackground.setMediaItem(queue[index]);
    });
    _eventSubscription = _player.playbackEventStream.listen((event) {
      _broadcastState();
    });
    _player.processingStateStream.listen((state) {
      switch (state) {
        case ProcessingState.completed:
          // In this example, the service stops when reaching the end.
          onStop();
          break;
        case ProcessingState.ready:
          // If we just came from skipping between tracks, clear the skip
          // state now that we're ready to play.
          _skipState = null;
          break;
        default:
          break;
      }
    });
    await AudioServiceBackground.setQueue(queue);
    try {
      await _player.setAudioSource(ConcatenatingAudioSource(
        children:
            queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
      ));
      // In this example, we automatically start playing on start.
    } catch (e) {
      print("Error: $e");
      onStop();
    }
    return super.onStart(params);
  }

  @override
  Future<void> onUpdateQueue(List<MediaItem> queue1) async {
    print('object');
    print('Adding data to queue');
    queue.clear();
    queue.addAll(queue1);
    try {
      await AudioServiceBackground.setQueue(queue);
      await _player.setAudioSource(ConcatenatingAudioSource(
        children:
            queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
      ));
    } catch (e) {
      print("Error: $e");
      onStop();
    }

    return super.onUpdateQueue(queue);
  }

  @override
  Future<void> onPlay() async => await _player.play();

  @override
  Future<void> onPause() async => await _player.pause();

  @override
  Future<void> onStop() async {
    await _player.stop();
    _eventSubscription.cancel();
    // It is important to wait for this state to be broadcast before we shut
    // down the task. If we don't, the background task will be destroyed before
    // the message gets sent to the UI.
    // await _broadcastState();
    // Shut down this task
    await super.onStop();
  }

  @override
  Future<void> onClose() async {
    await _player.dispose();
    _eventSubscription.cancel();
    return super.onClose();
  }

  @override
  Future<void> onSeekTo(Duration position) => _player.seek(position);

  @override
  Future<void> onFastForward() => _seekRelative(fastForwardInterval);

  @override
  Future<void> onRewind() => _seekRelative(-rewindInterval);

  @override
  Future<void> onSeekForward(bool begin) async => _seekContinuously(begin, 1);
  @override
  Future<void> onAddQueueItem(MediaItem mediaItem) async {
    if (!queue.any((element) => element.id == mediaItem.id)) {
      queue.add(mediaItem);
      await AudioServiceBackground.setQueue(queue);
      await _player.setAudioSource(ConcatenatingAudioSource(
        children:
            queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
      ));
    }
    await AudioService.playFromMediaId(
      mediaItem.id,
    );
    return super.onAddQueueItem(mediaItem);
  }

  // @override
  // Future<void> playFromMediaId(String medisId) async {}

  @override
  Future<void> onPlayFromMediaId(String mediaId) {
    // Then default implementations of onSkipToNext and onSkipToPrevious will
    // delegate to this method.
    final newIndex = queue.indexWhere((item) => item.id == mediaId);
    print(newIndex);
    if (newIndex != -1) {
      _skipState = newIndex > index!
          ? AudioProcessingState.skippingToNext
          : AudioProcessingState.skippingToPrevious;
      // This jumps to the beginning of the queue item at newIndex.
      _player.seek(Duration.zero, index: newIndex);
      // Demonstrate custom events.
      _player.play();
    }

    // During a skip, the player may enter the buffering state. We could just
    // propagate that state directly to AudioService clients but AudioService
    // has some more specific states we could use for skipping to next and
    // previous. This variable holds the preferred state to send instead of
    // buffering during a skip, and it is cleared as soon as the player exits
    // buffering (see the listener in onStart).

    return super.onPlayFromMediaId(mediaId);
  }

  @override
  Future<void> onSeekBackward(bool begin) async => _seekContinuously(begin, -1);
  Future<void> _seekRelative(Duration offset) async {
    var newPosition = _player.position + offset;
    // Make sure we don't jump out of bounds.
    if (newPosition < Duration.zero) newPosition = Duration.zero;
    if (newPosition > mediaItem!.duration!) newPosition = mediaItem!.duration!;
    // Perform the jump via a seek.
    await _player.seek(newPosition);
  }

  /// Begins or stops a continuous seek in [direction]. After it begins it will
  /// continue seeking forward or backward by 10 seconds within the audio, at
  /// intervals of 1 second in app time.
  void _seekContinuously(bool begin, int direction) {
    _seeker?.stop();
    if (begin) {
      _seeker = Seeker(
        _player,
        Duration(seconds: 10 * direction),
        Duration(seconds: 1),
        mediaItem!,
      )..start();
    }
  }

  @override
  Future<void> onSkipToQueueItem(String mediaId) async {
    // Then default implementations of onSkipToNext and onSkipToPrevious will
    // delegate to this method.
    final newIndex = queue.indexWhere((item) => item.id == mediaId);
    print(newIndex);
    if (newIndex == -1) return;
    // During a skip, the player may enter the buffering state. We could just
    // propagate that state directly to AudioService clients but AudioService
    // has some more specific states we could use for skipping to next and
    // previous. This variable holds the preferred state to send instead of
    // buffering during a skip, and it is cleared as soon as the player exits
    // buffering (see the listener in onStart).
    if (index != null && index! < 0)
      _skipState = newIndex > index!
          ? AudioProcessingState.skippingToNext
          : AudioProcessingState.skippingToPrevious;
    else
      _skipState = null;
    // This jumps to the beginning of the queue item at newIndex.
    _player.seek(Duration.zero, index: newIndex);
    // Demonstrate custom events.
    _player.play();
    AudioServiceBackground.sendCustomEvent('skip to $newIndex');
  }

  Future<void> _broadcastState() async {
    await AudioServiceBackground.setState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      systemActions: [
        MediaAction.seekTo,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      ],
      androidCompactActions: [0, 1, 3],
      processingState: _getProcessingState(),
      playing: _player.playing,
      position: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
    );
  }

  AudioProcessingState _getProcessingState() {
    if (_skipState != null) return _skipState!;
    switch (_player.processingState) {
      case ProcessingState.idle:
        return AudioProcessingState.stopped;
      case ProcessingState.loading:
        return AudioProcessingState.connecting;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
      default:
        throw Exception("Invalid state: ${_player.processingState}");
    }
  }

  @override
  Future<void> onSetRepeatMode(AudioServiceRepeatMode repeatMode) {
    switch (repeatMode) {
      case AudioServiceRepeatMode.all:
        _player.setLoopMode(LoopMode.all);
        break;
      case AudioServiceRepeatMode.none:
        _player.setLoopMode(LoopMode.off);
        break;
      case AudioServiceRepeatMode.one:
        _player.setLoopMode(LoopMode.one);
        break;
      default:
    }
    return super.onSetRepeatMode(repeatMode);
  }

  @override
  Future<void> onSetShuffleMode(AudioServiceShuffleMode shuffleMode) {
    switch (shuffleMode) {
      case AudioServiceShuffleMode.all:
        _player.setShuffleModeEnabled(true);
        break;
      case AudioServiceShuffleMode.none:
        _player.setShuffleModeEnabled(false);
        break;
      case AudioServiceShuffleMode.group:
        _player.setShuffleModeEnabled(true);
        break;
      default:
    }
    return super.onSetShuffleMode(shuffleMode);
  }
}
