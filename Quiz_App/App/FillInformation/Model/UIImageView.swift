import UIKit

extension UIImageView{
    
    func roundedImage()
    {
        self.layer.cornerRadius = self.frame.size.width / 4
        self.clipsToBounds = true
    }
    
    func backgroundImage()
    {
        self.layer.cornerRadius = self.frame.size.width / 5
        self.clipsToBounds = true
    }
}
