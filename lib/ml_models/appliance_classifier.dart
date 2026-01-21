import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

/// High-level helper around ML Kit's image labeling APIs used to
/// identify common home appliances from a captured image.
///
/// This class is intentionally self-contained so it can be swapped or
/// extended later without touching the UI / chatbot layers.
class ApplianceClassifier {
  final ImageLabeler _labeler;

  ApplianceClassifier._(this._labeler);

  /// Creates an instance with reasonable defaults for on-device
  /// appliance classification.
  factory ApplianceClassifier.create() {
    final options = ImageLabelerOptions(
      confidenceThreshold: 0.15,
    );
    final labeler = ImageLabeler(options: options);
    return ApplianceClassifier._(labeler);
  }

  /// Runs image labeling and returns a normalized appliance name such as
  /// `Laptop`, `PC`, `Air Conditioner`, `Fan`, etc. When no confident
  /// match is found, an empty string is returned.
  Future<String> classify(File file) async {
    final inputImage = InputImage.fromFile(file);
    final labels = await _labeler.processImage(inputImage);

    if (labels.isEmpty) {
      return '';
    }

    // Aggregate scores per appliance type instead of returning on the
    // first match, so that we can choose the most likely candidate.
    double mobileScore = 0;
    double laptopScore = 0;
    double pcScore = 0;
    double acScore = 0;
    double fanScore = 0;
    double washingScore = 0;
    double fridgeScore = 0;
    double tvScore = 0;

    for (final label in labels) {
      final text = label.label.toLowerCase();
      final c = label.confidence;

      if (text.contains('mobile phone') ||
          text.contains('smartphone') ||
          text.contains('cell phone') ||
          text.contains('cellular phone')) {
        if (c > mobileScore) mobileScore = c;
      }

      if (text.contains('laptop') ||
          text.contains('notebook') ||
          text.contains('laptop computer')) {
        if (c > laptopScore) laptopScore = c;
      }

      if (text.contains('desktop') ||
          text.contains('personal computer') ||
          (text.contains('pc') && !text.contains('laptop')) ||
          (text.contains('computer') &&
              !text.contains('laptop') &&
              !text.contains('notebook'))) {
        if (c > pcScore) pcScore = c;
      }

      if (text.contains('air conditioner') ||
          text.contains('air conditioning') ||
          text.contains('ac unit') ||
          text.contains('aircon')) {
        if (c > acScore) acScore = c;
      }

      if (text.contains('fan')) {
        if (c > fanScore) fanScore = c;
      }

      if (text.contains('washing machine') ||
          text.contains('washer') ||
          text.contains('washing')) {
        if (c > washingScore) washingScore = c;
      }

      if (text.contains('refrigerator') ||
          text.contains('fridge') ||
          text.contains('freezer')) {
        if (c > fridgeScore) fridgeScore = c;
      }

      if (text.contains('television') ||
          text.contains('tv') ||
          text.contains('monitor tv')) {
        if (c > tvScore) tvScore = c;
      }
    }

    // Prefer stronger appliance scores with simple thresholds.
    if (acScore >= 0.25 && acScore >= fanScore && acScore >= mobileScore) {
      return 'Air Conditioner';
    }
    if (fanScore >= 0.18 && fanScore >= acScore && fanScore >= mobileScore) {
      return 'Fan';
    }
    if (laptopScore >= 0.3 && laptopScore >= pcScore) {
      return 'Laptop';
    }
    if (pcScore >= 0.3) {
      return 'PC';
    }
    if (washingScore >= 0.3) {
      return 'Washing Machine';
    }
    if (fridgeScore >= 0.3) {
      return 'Refrigerator';
    }
    if (tvScore >= 0.3) {
      return 'Television';
    }
    if (mobileScore >= 0.6) {
      return 'Mobile Phone';
    }

    return '';
  }

  /// Always call this when the classifier is no longer needed to
  /// release underlying native resources.
  Future<void> close() async {
    await _labeler.close();
  }
}
