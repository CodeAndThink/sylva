import 'dart:convert';
import 'dart:io';

void main() {
  final additions = {
    'en': {
      'privacyPolicy': 'Privacy Policy',
      'termsOfService': 'Terms of Service',
    },
    'vi': {
      'privacyPolicy': 'Chính sách b?o m?t',
      'termsOfService': 'Ði?u kho?n d?ch v?',
    },
    'ja': {
      'privacyPolicy': '??????????',
      'termsOfService': '????',
    },
    'zh': {
      'privacyPolicy': '????',
      'termsOfService': '????',
    }
  };

  final dir = Directory('lib/l10n');
  final arbFiles = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.arb'));

  for (final file in arbFiles) {
    final lang = file.path.split('_').last.split('.').first;
    final content = file.readAsStringSync();
    final Map<String, dynamic> json = jsonDecode(content);
    
    if (additions.containsKey(lang)) {
      final toAdd = additions[lang]!;
      json['privacyPolicy'] = toAdd['privacyPolicy'];
      json['@privacyPolicy'] = {};
      json['termsOfService'] = toAdd['termsOfService'];
      json['@termsOfService'] = {};
    }
    
    final encoder = JsonEncoder.withIndent('  ');
    final newContent = encoder.convert(json);
    file.writeAsStringSync(newContent);
    print('Updated file');
  }
}
