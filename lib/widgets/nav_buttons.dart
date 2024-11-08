import 'package:flutter/material.dart';

class NavButtons extends StatefulWidget {
  final String text;
  final int index;
  final ValueChanged<int> onTap;
  final int activeIndex;

  const NavButtons({
    super.key,
    required this.text,
    required this.index,
    required this.onTap,
    required this.activeIndex,
  });

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.index); // Trigger the callback to update active index
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: widget.activeIndex == widget.index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: widget.activeIndex == widget.index ? 35 : 0,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: widget.activeIndex == widget.index
                  ? Colors.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}
