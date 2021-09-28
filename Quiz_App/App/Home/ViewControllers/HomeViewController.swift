import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labelP: UILabel!
    
    @IBOutlet weak var audioLabel: UILabel!
    @IBOutlet weak var quizLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var listenButton: UIButton!
    @IBOutlet weak var imageP: UIImageView!
    
    var finalPoints: Int = 0
    let userDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        var userSelected: User?
        let userId = userDefaults.string(forKey: "app")
        if let usersData = userDefaults.data(forKey: "users")
        {
            do{
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: usersData)
                for user in users {
                    if userId == user.id
                    {
                        userSelected = user
                    }
                }
            }
            catch {
                print ("catch")
            }
        }
        

        if let userSelected = userSelected
        {
            label.text = userSelected.name
            pointsLabel.text = String(userSelected.points)
            imageP.image = UIImage(data: userSelected.image)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelP.text = labelP.text?.localized
        quizLabel.text = quizLabel.text?.localized
        audioLabel.text = audioLabel.text?.localized

        imageP.round()
        
        quizButton.layer.cornerRadius = 15
        quizButton.clipsToBounds = true
        
        listenButton.layer.cornerRadius = 15
        listenButton.clipsToBounds = true
        
        let b = "Back"
        let backButton = UIBarButtonItem(title: b.localized, style: UIBarButtonItem.Style.plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem = backButton
    
    }
    
}


