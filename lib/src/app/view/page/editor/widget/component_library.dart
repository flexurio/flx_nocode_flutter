import 'package:flx_nocode_flutter/src/app/view/page/editor/widget/card_component.dart';
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
          Gap(12),
          ComponentGroup(
            title: 'Core Components',
            children: [
              TextWidget(),
              ButtonWidget(),
            ],
          ),
          Gap(24),
          ComponentGroup(
            title: 'Layout Components',
            children: [
              TextWidget(),
              ButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class ComponentGroup extends StatelessWidget {
  const ComponentGroup({
    super.key,
    required this.title,
    required this.children,
  });
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Gap(12),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: children,
        ),
      ],
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
    final widget = Button.action(
      action: DataAction.submit,
      onPressed: () {},
      permission: null,
    );

    return CardComponent(
      child: Draggable<Widget>(
        data: widget,
        feedback: Material(
          color: Colors.transparent,
          child: Theme(
            data: Theme.of(context),
            child: widget,
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
