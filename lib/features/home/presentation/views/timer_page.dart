import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/home/presentation/view_model/timer_view_model.dart';
import 'package:body_buliding/sheard/custom_appbar.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final CountDownController _controller = CountDownController();
  late final TimerViewModel _viewModel;
  bool _hasStarted =
      false; // Tracks if the controller has been started manually
  int _remainingSeconds = 90; // Default total seconds (2 minutes)

  @override
  void initState() {
    super.initState();
    _viewModel = TimerViewModel();
    _viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    // Triggers rebuild when the ViewModel notifies listeners (updates icons/text)
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    _viewModel.togglePlayPause();
    if (_viewModel.isPlaying) {
      if (!_hasStarted) {
        _controller.start();
        setState(() {
          _hasStarted = true;
        });
      } else {
        _controller.resume();
      }
    } else {
      _controller.pause();
    }
    setState(() {});
  }

  void _reset() {
    _viewModel.reset();
    _controller.restart(duration: _viewModel.duration);
    setState(() {
      _hasStarted = true;
      _remainingSeconds = _viewModel.duration;
    });
  }

  void _skip() {
    _viewModel.skipOrComplete();
    _controller.restart(duration: _viewModel.duration);
    setState(() {
      _hasStarted = true;
      _remainingSeconds = _viewModel.duration;
    });
  }

  void _addMinute() {
    setState(() {
      _remainingSeconds += 30;
      _hasStarted = true;
    });
    _controller.restart(duration: _remainingSeconds);
    if (!_viewModel.isPlaying) {
      _controller.pause();
    }
  }

  void _parseRemainingSeconds(String timeStamp) {
    final parts = timeStamp.split(':');
    if (parts.length == 2) {
      final minutes = int.tryParse(parts[0]) ?? 0;
      final seconds = int.tryParse(parts[1]) ?? 0;
      _remainingSeconds = (minutes * 60) + seconds;
    } else if (parts.length == 1) {
      _remainingSeconds = int.tryParse(parts[0]) ?? _remainingSeconds;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        appBar: CustomAppBar(title: 'تايمر الراحه'),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallHeight = constraints.maxHeight < 620;
              final isNarrow = constraints.maxWidth < 360;
              final timerSize =
                  (constraints.maxHeight * 0.35).clamp(180.0, 260.0);
              final buttonSpacing = isNarrow ? 16.0 : 32.0;
              final horizontalPadding = isNarrow ? 16.0 : 40.0;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 12),
                            // 1. Timer Section
                            Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularCountDownTimer(
                                    duration: _viewModel.duration,
                                    initialDuration: 0,
                                    controller: _controller,
                                    width: timerSize,
                                    height: timerSize,
                                    ringColor: const Color(0xFF1E222F),
                                    fillColor: const Color(0xFFBBF246),
                                    backgroundColor: Colors.transparent,
                                    strokeWidth: timerSize < 220 ? 10.0 : 12.0,
                                    strokeCap: StrokeCap.round,
                                    isReverse: true,
                                    isReverseAnimation: true,
                                    isTimerTextShown: true,
                                    textFormat: CountdownTextFormat.MM_SS,
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: timerSize < 220 ? 40 : 54,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                    autoStart: false,
                                    onChange: (String timeStamp) {
                                      _parseRemainingSeconds(timeStamp);
                                    },
                                    onComplete: () {
                                      _skip();
                                    },
                                  ),
                                  Positioned(
                                    bottom: timerSize * 0.28,
                                    child: const Text(
                                      'وقت الراحة',
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: isSmallHeight ? 12 : 24),

                            // 2. Set and Exercise Information
                            Column(
                              children: [
                                Text(
                                  'المجموعة ${_viewModel.currentSet} من ${_viewModel.totalSets}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'تمرين: ${_viewModel.exerciseName}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isSmallHeight ? 16 : 32),

                            // 3. Control Buttons Row
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Reset Button (Left in RTL layout)
                                  _buildOutlinedButton(
                                    icon: Icons.replay_rounded,
                                    onTap: _reset,
                                  ),
                                  SizedBox(width: buttonSpacing),

                                  // Play/Pause Button (Center)
                                  _buildPlayPauseButton(),
                                  SizedBox(width: buttonSpacing),

                                  // +1 Minute Button (Right in RTL layout)
                                  _buildOutlinedButton(
                                    icon: Icons.add_rounded,
                                    onTap: _addMinute,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: isSmallHeight ? 16 : 32),

                            // 4. Bottom Action Button
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: OutlinedButton(
                                  onPressed: _skip,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Colors.white24,
                                      width: 1.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text(
                                    'تخطي الراحة',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white12, width: 1.5),
        color: const Color(0x661E222F),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Container(
        width: 76,
        height: 76,
        decoration: const BoxDecoration(
          color: Color(0xFFBBF246),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x33BBF246),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            _viewModel.isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            color: Colors.black,
            size: 38,
          ),
        ),
      ),
    );
  }
}
