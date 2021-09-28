
import UIKit

extension UIImageView{
    
    func round()
    {
        self.layer.cornerRadius = self.frame.size.width / 4
        self.clipsToBounds = true
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
}
