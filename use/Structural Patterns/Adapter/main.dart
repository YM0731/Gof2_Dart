/// 名前：アダプターパターン
/// 実装で使えるか：使える
/// 内容：
/// 　互換性のないインターフェース同士をつなぎ、異なるインターフェースを持つクラスを
/// 　あたかも同じインターフェースを持つかのうように振舞わせる
/// 構成要素：
/// 　Target：クライアントが使用するインターフェース
/// 　Adapter：Targetインターフェースを実装し、Adpteeを呼び出す
/// 　Adaptee：変換されるインターフェースを持つ既存のクラス

void main() {
  OldMediaPlayer oldMediaPlayer = OldMediaPlayer();
  MediaPlayer player = MediaPlayerAdpter(oldMediaPlayer);
  player.play('song.mp3');
}

/// 既存のインターフェース（Adaptee）
class OldMediaPlayer {
  /// 音楽再生
  void playOldMedia(String fileName) {
    print(fileName);
  }
}

/// 新しいインターフェース（Target）
abstract class MediaPlayer {
  /// 音楽再生
  void play(String fileName);
}

/// Adapterクラス
class MediaPlayerAdpter implements MediaPlayer {
  /// 既存のインターフェース
  final OldMediaPlayer _oldMediaPlayer;

  /// コンストラクタ
  ///
  /// [_oldMediaPlayer] 既存のインターフェース
  MediaPlayerAdpter(this._oldMediaPlayer);

  /// 音楽再生
  @override
  void play(String fileName) {
    _oldMediaPlayer.playOldMedia(fileName);
  }
}
