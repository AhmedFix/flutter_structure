library flutter_structure;

import 'dart:io';

void main(List<String> args) {
  // Check if the user provided a target directory
  if (args.isEmpty) {
    print('Usage: dart run structure_generator <target_directory>');
    return;
  }

  final String targetDir = args[0];

  // Define the folder structure
  final List<String> directories = [
    '$targetDir/bindings',
    '$targetDir/controllers',
    '$targetDir/screens',
    '$targetDir/widgets',
    '$targetDir/models',
    '$targetDir/services',
    '$targetDir/utils',
  ];

  // Create directories
  for (String dir in directories) {
    if (!Directory(dir).existsSync()) {
      Directory(dir).createSync(recursive: true);
      print('Created directory: $dir');
    } else {
      print('Directory already exists: $dir');
    }
  }

  // Define the files to create
  final List<String> files = [
    '$targetDir/main.dart',
    '$targetDir/app.dart',
    '$targetDir/bindings/bindings.dart',
    '$targetDir/controllers/controllers.dart',
    '$targetDir/screens/screens.dart',
    '$targetDir/widgets/widgets.dart',
    '$targetDir/models/models.dart',
    '$targetDir/services/services.dart',
    '$targetDir/utils/app_colors.dart',
    '$targetDir/utils/app_constants.dart',
    '$targetDir/utils/app_themes.dart',
    '$targetDir/utils/app_styles.dart',
    '$targetDir/utils/utils.dart',
  ];

  // Create files
  for (String file in files) {
    if (!File(file).existsSync()) {
      File(file).createSync();
      print('Created file: $file');

      // Populate app.dart with imports for all other files
      if (file == '$targetDir/app.dart') {
        final appImports = '''
export 'bindings/bindings.dart';
export 'controllers/controllers.dart';
export 'models/models.dart';
export 'screens/screens.dart';
export 'widgets/widgets.dart';
export 'services/services.dart';
''';
        File(file).writeAsStringSync(appImports);
      }

      // Populate utils.dart with imports for all utility files
      if (file == '$targetDir/utils/utils.dart') {
        final utilsImports = '''
export 'app_colors.dart';
export 'app_constants.dart';
export 'app_themes.dart';
export 'app_styles.dart';
''';
        File(file).writeAsStringSync(utilsImports);
      }
    } else {
      print('File already exists: $file');
    }
  }

  print('Project structure created successfully in $targetDir!');
}
