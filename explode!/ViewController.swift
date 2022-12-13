//
//  ViewController.swift
//  explode!
//
//  Created by KentoFujita on 2022/12/11.
//

import UIKit


class ViewController: UIViewController {
    
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
        
        explodefunc = Int.random(in:0...19)
        
        if explodefunc == 7{
            bombImage.image = #imageLiteral(resourceName: "bakuha")
            countLabel.text = "GAMEOVER"
            
        }
        else{
            explodecount += 1
            let  counter = String( explodecount )
            countLabel.text = counter
            
        }
    }
    
    
}
