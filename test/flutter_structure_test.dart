import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_structure/flutter_structure.dart';
import 'dart:io';

void main(List<String> list) {
  group('Project Structure Generator Tests', () {
    final String testDir = 'test_project_structure';

    setUp(() {
      // Clean up before each test
      if (Directory(testDir).existsSync()) {
        Directory(testDir).deleteSync(recursive: true);
      }
    });

    test('Generates project structure', () {
      // Run the structure generator
      main([testDir]);

      // Check if directories were created
      expect(Directory('$testDir/bindings').existsSync(), isTrue);
      expect(Directory('$testDir/controllers').existsSync(), isTrue);
      expect(Directory('$testDir/screens').existsSync(), isTrue);
      expect(Directory('$testDir/widgets').existsSync(), isTrue);
      expect(Directory('$testDir/models').existsSync(), isTrue);
      expect(Directory('$testDir/services').existsSync(), isTrue);
      expect(Directory('$testDir/utils').existsSync(), isTrue);

      // Check if files were created
      expect(File('$testDir/main.dart').existsSync(), isTrue);
      expect(File('$testDir/app.dart').existsSync(), isTrue);
      expect(File('$testDir/bindings/bindings.dart').existsSync(), isTrue);
      expect(
          File('$testDir/controllers/controllers.dart').existsSync(), isTrue);
      expect(File('$testDir/screens/screens.dart').existsSync(), isTrue);
      expect(File('$testDir/widgets/widgets.dart').existsSync(), isTrue);
      expect(File('$testDir/models/models.dart').existsSync(), isTrue);
      expect(File('$testDir/services/services.dart').existsSync(), isTrue);
      expect(File('$testDir/utils/app_colors.dart').existsSync(), isTrue);
      expect(File('$testDir/utils/app_constants.dart').existsSync(), isTrue);
      expect(File('$testDir/utils/app_themes.dart').existsSync(), isTrue);
      expect(File('$testDir/utils/app_styles.dart').existsSync(), isTrue);
      expect(File('$testDir/utils/utils.dart').existsSync(), isTrue);
    });

    tearDown(() {
      // Clean up after each test
      if (Directory(testDir).existsSync()) {
        Directory(testDir).deleteSync(recursive: true);
      }
    });
  });
}
