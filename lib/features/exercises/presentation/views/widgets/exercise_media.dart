import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:body_buliding/features/home/data/exercise_model.dart';
import 'package:body_buliding/core/utils/app_colors.dart';

class ExerciseMedia extends StatefulWidget {
  final ExerciseModel exercise;
  final double size;

  const ExerciseMedia({
    super.key,
    required this.exercise,
    this.size = 88.0,
  });

  @override
  State<ExerciseMedia> createState() => _ExerciseMediaState();
}

class _ExerciseMediaState extends State<ExerciseMedia> {
  /// Tracks the single active instance across all ExerciseMedia widgets.
  static _ExerciseMediaState? _activeInstance;

  VideoPlayerController? _controller;
  int _loopCount = 0;
  static const int _maxLoops = 5;

  @override
  void initState() {
    super.initState();
    // Do NOT initialize video here to prevent freezing
  }

  @override
  void didUpdateWidget(ExerciseMedia oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.exercise.videoPath != widget.exercise.videoPath) {
      _disposeController();
    }
  }

  void _handleTap() {
    if (widget.exercise.videoPath == null || _controller != null) return;

    // Dispose the previously active instance before starting a new one
    if (_activeInstance != null && _activeInstance != this) {
      _activeInstance!._resetToThumbnail();
    }
    _activeInstance = this;

    _loopCount = 0;

    setState(() {
      // Set controller immediately to rebuild and hide the play overlay instantly
      _controller = VideoPlayerController.asset(widget.exercise.videoPath!);
    });

    _controller!.initialize().then((_) {
      if (!mounted) return;
      _controller!.setLooping(true);
      _controller!.setVolume(0.0);
      _controller!.addListener(_onVideoProgress);
      _controller!.play();
      setState(() {}); // Update to show the video once initialized
    });
  }

  /// Monitors video position to count loops and auto-stop after [_maxLoops].
  void _onVideoProgress() {
    if (_controller == null || !_controller!.value.isInitialized) return;

    final duration = _controller!.value.duration;
    final position = _controller!.value.position;

    // Detect loop completion when position resets near the start
    if (duration > Duration.zero &&
        position < const Duration(milliseconds: 200) &&
        _controller!.value.isPlaying) {
      _loopCount++;
      if (_loopCount >= _maxLoops) {
        _resetToThumbnail();
      }
    }
  }

  /// Disposes the controller and resets the widget back to thumbnail state.
  void _resetToThumbnail() {
    if (_activeInstance == this) {
      _activeInstance = null;
    }
    _disposeController();
  }

  /// Safely disposes the video controller and cleans up the listener.
  void _disposeController() {
    _controller?.removeListener(_onVideoProgress);
    _controller?.dispose();
    _controller = null;
    _loopCount = 0;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    if (_activeInstance == this) {
      _activeInstance = null;
    }
    _controller?.removeListener(_onVideoProgress);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: widget.exercise.videoPath != null &&
                    _controller != null &&
                    _controller!.value.isInitialized
                ? SizedBox.expand(
                    key: const ValueKey('video'),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller!.value.size.width,
                        height: _controller!.value.size.height,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
                  )
                : Stack(
                    key: const ValueKey('thumbnail'),
                    fit: StackFit.expand,
                    children: [
                       Image.asset(
                        widget.exercise.thumbNail,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.white10,
                            child: const Icon(Icons.image, color: Colors.white30),
                          );
                        },
                      ),
                      if (widget.exercise.videoPath != null && _controller == null)
                        Container(
                          color: Colors.black.withValues(alpha: 0.4),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              color: AppColors.primary,
                              size: 32,
                            ),
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
