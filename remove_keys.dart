import 'dart:convert';
import 'dart:io';

void main() {
  final keysToRemove = [
    'premium',
    'cancelMonthlyTitle',
    'cancelMonthlyMessage',
    'manageSubscriptions',
    'privacyPolicy',
    'termsOfService',
    'homeWidgetDialogTitle',
    'homeWidgetDialogSubtitle',
    'homeWidgetStep1',
    'homeWidgetStep2',
    'homeWidgetStep3',
    'homeWidgetStep4',
    'understood'
  ];

  final dir = Directory('lib/l10n');
  final arbFiles = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.arb'));

  for (final file in arbFiles) {
    final content = file.readAsStringSync();
    final Map<String, dynamic> json = jsonDecode(content);
    
    for (final key in keysToRemove) {
      json.remove(key);
      json.remove('@' + key);
    }
    
    final encoder = JsonEncoder.withIndent('  ');
    final newContent = encoder.convert(json);
    file.writeAsStringSync(newContent);
    print('Updated file');
  }
}
