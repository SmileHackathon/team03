//
//  Shake.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import UIKit
import CoreMotion

class Shake: UIViewController {
    let SS = SwingSound()
    @IBOutlet weak var ten: UILabel!
    @IBOutlet weak var Shake: UILabel!
    @IBOutlet weak var kanshake: UILabel!
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.type == UIEvent.EventType.motion && event?.subtype == UIEvent.EventSubtype.motionShake {
            count+=1
            if 10-count >= 0{
            ten.text = String(10-count)
            }else{
                ten.text = String(0)
            }
            SS.swingSound()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.type == UIEvent.EventType.motion && event?.subtype == UIEvent.EventSubtype.motionShake {
            if count >= 10{
                self.performSegue(withIdentifier: "fukuwarai", sender: nil)            }
        }
    }
    
    
}
