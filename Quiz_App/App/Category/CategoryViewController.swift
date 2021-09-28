

import UIKit

class CategoryViewController: UIViewController {
    
    var selectedCategory: Category?

    @IBOutlet weak var chooseCategoryLabel: UILabel!
    
    //Category Buttons
    @IBOutlet weak var mathButton: UIButton!
    @IBOutlet weak var geographyButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var biologyButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        chooseCategoryLabel.text = chooseCategoryLabel.text?.localized
        mathButton.setTitle(mathButton.titleLabel?.text?.localized, for: .normal)
        geographyButton.setTitle(geographyButton.titleLabel?.text?.localized, for: .normal)
        historyButton.setTitle(historyButton.titleLabel?.text?.localized, for: .normal)
        biologyButton.setTitle(biologyButton.titleLabel?.text?.localized, for: .normal)
        englishButton.setTitle(englishButton.titleLabel?.text?.localized, for: .normal)
    }
    
    
    @IBAction func mathButtonClicked(_ sender: UIButton) {
        selectedCategory = .Math
        performSegue(withIdentifier: "category", sender: self)
    }
    
    @IBAction func geographyButtonClicked(_ sender: UIButton) {
        selectedCategory = .Geography
        performSegue(withIdentifier: "category", sender: self)
        
    }
    @IBAction func historyButtonClicked(_ sender: UIButton) {
        selectedCategory = .History
        performSegue(withIdentifier: "category", sender: self)
        
    }
    @IBAction func biologyButtonClicked(_ sender: UIButton) {
        selectedCategory = .Biology
        performSegue(withIdentifier: "category", sender: self)
    }
    @IBAction func englishButtonClicked(_ sender: UIButton) {
        selectedCategory = .English
        performSegue(withIdentifier: "category", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "category"
        {
            let vc = segue.destination as! QuizViewController
            vc.selectedCategory = self.selectedCategory
            let b = "Back"
            let backButton = UIBarButtonItem(title: b.localized, style: UIBarButtonItem.Style.plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem = backButton

        }
    }
    

}
