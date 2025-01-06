import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SidebarWidgetLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Core Components',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              TextWidget(),
              ButtonWidget(),
            ],
          )
        ],
      ),
    );
  }
}

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Draggable<Widget>(
        data: Text('Text'),
        feedback: Material(
          color: Colors.transparent,
          child: Text(
            'Text',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
        childWhenDragging: Text(
          'Dragging...',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        child: Text(
          'Text',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Draggable<Widget>(
        data: Button(
          action: DataAction.submit,
          onPressed: () {},
          permission: null,
        ),
        feedback: Material(
          color: Colors.transparent,
          child: Text(
            'Button',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
        childWhenDragging: Text(
          'Dragging...',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        child: Text(
          'Button',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
