import 'package:portfolio/controllers/primary_section_controller.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/screens/homepage/widgets/poem_section.dart';

class SecondarySectionController {
  poemsReset(index) {
    PrimarySectionController primarySectionController = locator<PrimarySectionController>();

    SavedData savedData = locator<SavedData>();
    savedData.poemsParser.poems.forEach((p) {
      p.poem.isActive = false;
    });
    savedData.poemsParser.poems[index].poem.isActive = true;

    primarySectionController.renderSecondarySection(
        PoemSectionWidget(poemData: savedData.poemsParser.poems[index].poem));
  }
}
