import UIKit
import AVFoundation

class ListenViewController: UIViewController {

    var player: AVAudioPlayer?

    @IBOutlet weak var chooseLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var brainButton: UIButton!
    @IBOutlet weak var teleportButton: UIButton!


    var resource: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseLabel.text = chooseLabel.text?.localized
        
        sleepButton.setTitle(sleepButton.titleLabel?.text?.localized, for: .normal)
        
        brainButton.setTitle(brainButton.titleLabel?.text?.localized, for: .normal)
        
        teleportButton.setTitle(teleportButton.titleLabel?.text?.localized, for: .normal)
    }
    
    @IBAction func sleepTaped(_ sender: Any) {
        
        resource = "Why do we dream - Amy Adkins"
//        StoryTime.listen(resource: resource, b: snowButton)
        if let player = player, player.isPlaying {
            sleepButton.setTitle("PLAY", for: .normal)
            player.stop()
        }

        else {
            sleepButton.setTitle("STOP", for: .normal)
            let urlString = Bundle.main.path(forResource: resource, ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

                guard  let player = player  else {
                    return
                }
                player.play()
                }
            catch {
                print("something went wrong")
            }
        }
        
        
    }
    @IBAction func brainTapped(_ sender: Any) {
        
        resource = "Brain"
//        StoryTime.listen(resource: resource, b: snowButton)
        if let player = player, player.isPlaying {
            brainButton.setTitle("PLAY", for: .normal)
            player.stop()
        }

        else {
            brainButton.setTitle("STOP", for: .normal)
            let urlString = Bundle.main.path(forResource: resource, ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

                guard  let player = player  else {
                    return
                }
                player.play()
                }
            catch {
                print("something went wrong")
            }
        }
        
        
        
        
    }
    @IBAction func teleportTaped(_ sender: Any) {
        resource = "Teleport"
//        StoryTime.listen(resource: resource, b: snowButton)
        if let player = player, player.isPlaying {
            teleportButton.setTitle("PLAY", for: .normal)
            player.stop()
        }

        else {
            teleportButton.setTitle("STOP", for: .normal)
            let urlString = Bundle.main.path(forResource: resource, ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

                guard  let player = player  else {
                    return
                }
                player.play()
                }
            catch {
                print("something went wrong")
            }
        }
        
    }
    


}
