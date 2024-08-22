import 'package:hoam_v1/core/models/questions_model.dart';

class QuestionService {
  Future<List<QuestionModel>> getSampleQuestions() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {"question": "What is a homeowner’s association?", "answer": "An HOA is usually set up as a non-profit organization by a developer or builder when a planned community is first established to help support the sales and marketability of homes in the area. Depending on your state, HOAs must follow the same laws that govern any corporation or non-profit. They are run by a board of directors that are voted in by owners in the community. These board members establish governing documents that include Articles of Incorporation, Covenants, Conditions and Restrictions (CC&Rs), and By-Laws that act as the guide book for association members."},
      {"question": "How much will an HOA charge me every month?", "answer": "The fees that your HOA charges can vary a lot depending on where you live and what amenities they offer. The average monthly HOA fee is somewhere around 125 dollars but expect to pay more for a condo or townhome where HOA fees also include insurance and maintenance for buildings with shared walls."},
      {"question": "Do I have to pay even if I don't use the common areas?", "answer": "Yes. Once you move into a home that belongs to an HOA you are locked into paying their fees regardless of how much you plan on using the shared parks, pools, and other areas. Be sure to ask about required HOA payments before buying a home and get a better understanding of what is and is not included with those payments."},
      {"question": "Will HOA fees affect how much I can borrow?", "answer": "Yes. When borrowing money to purchase your home, lenders will look at potential taxes, insurance, and HOA payments. These factors may change how much house you can afford and ultimately how much a bank will lend you. If you’re on a tight budget, be mindful of any HOA fees that may be required once you purchase the home."},
      {"question": "What kind of things can an HOA regulate?", "answer": "In general, HOAs help ensure owners are properly caring for their homes, and that a consistent look and feel is maintained throughout a given neighborhood. This can include regulating what color you can paint your house, or how often you should mow your lawn. Specific rules will be outlined in the governing documents which you can be viewed upon request before purchasing a home."},
      {"question": "What happens if I don't pay or I break the rules?", "answer": "Most homeowners enjoy the protections that an HOA provides their home and community. Every association is run a little differently, but most of the time, any late payment or violation receives a polite reminder given in person or by mail. Nearly all violations are resolved at this level, but you may receive several warnings before further action is taken."},
      {"question": "How do HOA boards enforce the rules?", "answer": "HOAs will outline an escalation process for continued non-payments or violations. Communication is key, and chances are your HOA will work with you to resolve any issue that comes up. In some extreme cases, an HOA may have to take legal action against owners who continue to violate community guidelines and place a lean on their property until any issues are fully resolved."},  
    ];

    // Convert sample data to list of CarModel
    return sampleData.map((data) => QuestionModel.fromJson(data)).toList();
  }
}
