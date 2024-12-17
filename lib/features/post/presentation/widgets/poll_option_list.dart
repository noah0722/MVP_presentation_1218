import 'package:flutter/material.dart';

class PollOptionList extends StatelessWidget {
  final List<String> options;
  final Function(String) onAdd;
  final Function(int) onRemove;
  final Function(int, String) onUpdate;

  const PollOptionList({
    super.key,
    required this.options,
    required this.onAdd,
    required this.onRemove,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(options.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                // Option number
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Option input field
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '옵션 ${index + 1}',
                      suffixIcon: index >= 2
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => onRemove(index),
                            )
                          : null,
                    ),
                    controller: TextEditingController(text: options[index]),
                    onChanged: (value) => onUpdate(index, value),
                  ),
                ),
              ],
            ),
          );
        }),

        // Add option button
        if (options.length < 10)
          TextButton.icon(
            onPressed: () => onAdd(''),
            icon: const Icon(Icons.add),
            label: const Text('옵션 추가'),
          ),

        if (options.length < 2)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              '최소 2개의 옵션이 필요합니다',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
