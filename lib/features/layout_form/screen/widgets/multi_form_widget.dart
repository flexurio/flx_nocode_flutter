import 'package:flutter/material.dart';

/// Responsive multi-step form container with a clean horizontal stepper
/// and an active-step header banner so long step titles never clip or overlap.
class MultiFormWidget extends StatelessWidget {
  const MultiFormWidget({
    required this.children,
    required this.titles,
    required this.page,
    super.key,
  });

  final List<Widget> children;
  final List<String> titles;
  final int page;

  @override
  Widget build(BuildContext context) {
    final stepCount = titles.length;
    final safePage = stepCount == 0 ? 0 : page.clamp(0, stepCount - 1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (stepCount > 0) ...[
          _StepIndicatorBar(
            titles: titles,
            currentStep: safePage,
          ),
          const SizedBox(height: 12),
          _ActiveStepBanner(
            stepNumber: safePage + 1,
            totalSteps: stepCount,
            title: titles[safePage],
          ),
          const SizedBox(height: 16),
        ],
        ...List.generate(children.length, (index) {
          return Visibility(
            visible: index == safePage,
            maintainState: true,
            child: children[index],
          );
        }),
      ],
    );
  }
}

class _StepIndicatorBar extends StatelessWidget {
  const _StepIndicatorBar({
    required this.titles,
    required this.currentStep,
  });

  final List<String> titles;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final useScroll = titles.length > 5;
    final stepWidgets = List<Widget>.generate(titles.length, (index) {
      final item = _StepNode(
        index: index,
        total: titles.length,
        currentStep: currentStep,
        title: titles[index],
      );
      return useScroll
          ? SizedBox(width: 140, child: item)
          : Expanded(child: item);
    });

    if (useScroll) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: stepWidgets,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: stepWidgets,
    );
  }
}

class _StepNode extends StatelessWidget {
  const _StepNode({
    required this.index,
    required this.total,
    required this.currentStep,
    required this.title,
  });

  final int index;
  final int total;
  final int currentStep;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = theme.colorScheme.secondary;
    final inactiveLine =
        isDark ? Colors.white.withValues(alpha: 0.14) : Colors.grey.shade300;
    final isCompleted = index < currentStep;
    final isActive = index == currentStep;

    final leftConnectorColor = index == 0
        ? Colors.transparent
        : (index <= currentStep ? accent.withValues(alpha: 0.55) : inactiveLine);
    final rightConnectorColor = index == total - 1
        ? Colors.transparent
        : (isCompleted ? accent.withValues(alpha: 0.55) : inactiveLine);

    final circleBackground = isCompleted || isActive
        ? accent
        : (isDark ? Colors.white.withValues(alpha: 0.08) : Colors.grey.shade100);
    final circleBorder = isCompleted || isActive ? accent : inactiveLine;

    final labelColor = isActive
        ? theme.colorScheme.onSurface
        : (isCompleted
            ? theme.colorScheme.onSurface.withValues(alpha: 0.78)
            : theme.hintColor);

    return Tooltip(
      message: title,
      waitDuration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 34,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: leftConnectorColor,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleBackground,
                    border: Border.all(color: circleBorder, width: 1.5),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: accent.withValues(alpha: 0.25),
                              blurRadius: 0,
                              spreadRadius: 3,
                            ),
                          ]
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: theme.colorScheme.onSecondary,
                        )
                      : Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isActive
                                ? theme.colorScheme.onSecondary
                                : theme.hintColor,
                          ),
                        ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: rightConnectorColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                height: 1.25,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: labelColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveStepBanner extends StatelessWidget {
  const _ActiveStepBanner({
    required this.stepNumber,
    required this.totalSteps,
    required this.title,
  });

  final int stepNumber;
  final int totalSteps;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.secondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'Step $stepNumber/$totalSteps',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
