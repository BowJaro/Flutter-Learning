import 'package:flutter/material.dart';

class MyReactionButton extends StatefulWidget {
  final String? initialReaction;
  final int initialReactionCount;
  final Function(String?) onReactionChanged;

  const MyReactionButton({
    super.key,
    this.initialReaction,
    this.initialReactionCount = 0,
    required this.onReactionChanged,
  });

  @override
  State<MyReactionButton> createState() => _MyReactionButtonState();
}

class _MyReactionButtonState extends State<MyReactionButton> {
  late String? selectedReaction;
  late int reactionCount;
  OverlayEntry? _overlayEntry;
  Offset buttonPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    selectedReaction = widget.initialReaction;
    reactionCount = widget.initialReactionCount;
  }

  void _showReactionOptions() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideReactionOptions() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    buttonPosition = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _hideReactionOptions,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: _hideReactionOptions, // Close overlay on outside tap
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                top: buttonPosition.dy - 50,
                left: buttonPosition.dx,
                child: Row(
                  children: [
                    _buildOptionButton(Icons.thumb_up, 'like'),
                    const SizedBox(
                      width: 5,
                    ),
                    _buildOptionButton(Icons.thumb_down, 'dislike'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _showReactionOptions();
  }

  void _onOptionSelected(String? reaction) {
    setState(() {
      if (selectedReaction == reaction) {
        if (selectedReaction != null) {
          selectedReaction = null;
        } else {
          selectedReaction = 'like';
        }
      } else {
        selectedReaction = reaction;
      }
      widget.onReactionChanged(selectedReaction);
      _hideReactionOptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        child: GestureDetector(
          onTap: () => _onOptionSelected(selectedReaction),
          onLongPressStart: _onLongPressStart,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                selectedReaction == 'like'
                    ? Icons.thumb_up
                    : selectedReaction == 'dislike'
                        ? Icons.thumb_down
                        : Icons.thumb_up,
                color: selectedReaction == 'like'
                    ? Colors.blue
                    : selectedReaction == 'dislike'
                        ? Colors.red
                        : Colors.grey,
                size: 23,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$reactionCount',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(IconData icon, String reaction) {
    return GestureDetector(
      onTap: () => _onOptionSelected(reaction),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: reaction == 'like' ? Colors.blue : Colors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
