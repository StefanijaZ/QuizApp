import UIKit

class WelcomeViewController: UIViewController {


    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tapAnywhereToStartLabel: UILabel!
    
    
    @IBOutlet weak var enButton: UIButton!
    @IBOutlet weak var mkButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = welcomeLabel.text?.localized
        tapAnywhereToStartLabel.text = tapAnywhereToStartLabel.text?.localized
    }
    @IBAction func mkClicked(_ sender: Any) {
        UserDefaults.standard.set(Language.mk.rawValue, forKey: "app_language")
        viewDidLoad()
    }
    
    @IBAction func enClicked(_ sender: Any) {
        UserDefaults.standard.set(Language.en.rawValue, forKey: "app_language")
        viewDidLoad()
    }
    

    @IBAction func welcomeButtonClicked(_ sender: UIButton) {
            if UserDefaults.standard.string(forKey: "app") != nil
            {
                performSegue(withIdentifier: "welcomeScreenToNavigation", sender: self)
            }
            else
            {
                performSegue(withIdentifier: "welcomeScreenToFillInformation", sender: self)
            }
    
    }
}




