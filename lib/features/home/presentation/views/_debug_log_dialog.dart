import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DebugLogDialog extends StatefulWidget {
  final String logText;
  final File logFile;
  const DebugLogDialog(
      {super.key, required this.logText, required this.logFile});

  @override
  State<DebugLogDialog> createState() => DebugLogDialogState();
}

class DebugLogDialogState extends State<DebugLogDialog> {
  String _filter = '';
  int _tailLines = 200;
  late TextEditingController _filterController;
  late TextEditingController _tailController;
  late String _displayText;

  @override
  void initState() {
    super.initState();
    _filterController = TextEditingController();
    _tailController = TextEditingController(text: _tailLines.toString());
    _updateDisplayText();
  }

  void _updateDisplayText() {
    List<String> lines = widget.logText.split('\n');
    if (_tailLines > 0 && lines.length > _tailLines) {
      lines = lines.sublist(lines.length - _tailLines);
    }
    if (_filter.isNotEmpty) {
      lines = lines
          .where((line) => line.toLowerCase().contains(_filter.toLowerCase()))
          .toList();
    }
    setState(() {
      _displayText =
          lines.isEmpty ? 'No matching log entries.' : lines.join('\n');
    });
  }

  @override
  void dispose() {
    _filterController.dispose();
    _tailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Debug Log'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _filterController,
                    decoration: const InputDecoration(
                      labelText: 'Search/filter',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (val) {
                      _filter = val;
                      _updateDisplayText();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: _tailController,
                    decoration: const InputDecoration(
                      labelText: 'Tail',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      final n = int.tryParse(val);
                      if (n != null && n > 0) {
                        _tailLines = n;
                        _updateDisplayText();
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(
                  _displayText,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          icon: const Icon(Icons.copy),
          label: const Text('Copy'),
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: _displayText));
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copied to clipboard')));
          },
        ),
        TextButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text('Clear Log'),
          onPressed: () async {
            await widget.logFile.writeAsString('');
            if (!context.mounted) return;
            setState(() {
              _displayText = '';
            });
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Log file cleared')));
          },
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
