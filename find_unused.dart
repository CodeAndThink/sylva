import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('lib/l10n/intl_en.arb');
  final content = await file.readAsString();
  final Map<String, dynamic> json = jsonDecode(content);
  
  final keys = json.keys.where((k) => !k.startsWith('@') && k != '@@locale').toList();
  
  final dir = Directory('lib');
  final dartFiles = dir.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart')).toList();
  
  final unusedKeys = <String>[];
  
  for (final key in keys) {
    bool found = false;
    for (final dartFile in dartFiles) {
      final code = await dartFile.readAsString();
      if (code.contains(key)) {
        found = true;
        break;
      }
    }
    if (!found) {
      unusedKeys.add(key);
    }
  }
  
  print('Unused keys:');
  for (final key in unusedKeys) {
    print(key);
  }
}
