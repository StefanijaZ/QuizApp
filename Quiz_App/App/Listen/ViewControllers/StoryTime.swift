
import UIKit
import AVFoundation

public class StoryTime {


    public static func listen (resource: String, b: UIButton){
        var player: AVAudioPlayer?

        if let player = player, player.isPlaying {
            b.setTitle("Play", for: .normal)
            player.stop()
        }
    
        else {
            b.setTitle("Stop", for: .normal)
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
