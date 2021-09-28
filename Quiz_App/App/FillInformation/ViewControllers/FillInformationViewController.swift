import UIKit

class FillInformationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var startLabel: UIButton!
    
    @IBOutlet weak var choosePhotoButton: UIButton!
    @IBOutlet weak var photoBackground: UIImageView!
    
    @IBOutlet weak var photoGallery: UIImageView!
    
    @IBAction func didTapChooseButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        startLabel.setTitle(startLabel.titleLabel?.text?.localized, for: .normal)
        
        choosePhotoButton.setTitle(choosePhotoButton.titleLabel?.text?.localized, for: .normal)
        nameField.placeholder = nameField.placeholder?.localized
        nameField.delegate = self
        photoBackground.backgroundImage()
    }
    
    func create()
    {
        let encoder = JSONEncoder()
        let user = User(name: nameField.text!, image: photoGallery.image?.pngData() ?? Data())
        do {

            if let usersData = UserDefaults.standard.data(forKey: "users")
            {
                let decoder = JSONDecoder()
                var users = try decoder.decode([User].self, from: usersData)
                users.append(user)
                let data = try encoder.encode(users)
                UserDefaults.standard.set(data, forKey: "users")
                UserDefaults.standard.set(user.id, forKey: "app")
            }
            else
            {
                var users: [User] = [User]()
                users.append(user)
                let data = try encoder.encode(users)
                UserDefaults.standard.set(data, forKey: "users")
                UserDefaults.standard.set(user.id, forKey: "app")
            }
        } catch {
            print ("Error user")
        
        }
    }

    @IBAction func start(_ sender: Any) {
        if let name = nameField.text, !name.isEmpty
        {
            create()
            performSegue(withIdentifier: "name", sender: self)
        }
        else
        {
            let alert = UIAlertController(title: "Name alert", message: "Enter name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
       
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}


extension FillInformationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage{
            photoGallery.image = image;
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
