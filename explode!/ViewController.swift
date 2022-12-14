//
//  ViewController.swift
//  explode!
//
//  Created by KentoFujita on 2022/12/11.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    var explodecount = 0
    var explodefunc = 0
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var bombImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "0"
        bombImage.image = #imageLiteral(resourceName: "bakudan")
    }

    @IBAction func pushButton(_ sender: UIButton) {
        sender.alpha = 0.5
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        
        explodefunc = Int.random(in:0...19)
        
        if explodefunc == 7{
            playSound(name: "game_explosion9")
            bombImage.image = #imageLiteral(resourceName: "bakuha")
            countLabel.text = "GAMEOVER"
            
        }
        else{
            explodecount += 1
            let  counter = String( explodecount )
            countLabel.text = counter
            
        }
    }
    
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: "game_explosion9", ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player.delegate = self
            player.play()
        } catch {
        }
    }
    
    
    
    
    
}
