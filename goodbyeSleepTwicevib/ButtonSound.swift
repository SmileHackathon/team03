//
//  ButtonSound.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import Foundation
import AVFoundation
class ButtonSound{
    var BtaudioPlayer = AVAudioPlayer()
    func buttonSound(){
        let BtS = Bundle.main.bundleURL.appendingPathComponent("クリック音4.mp3")
        
        do{
            //audioPlayer = try AVAudioPlayer(contentsOf: sound,fileTypeHint: nil)
            BtaudioPlayer = try AVAudioPlayer(contentsOf: BtS)
            try AVAudioSession.sharedInstance().setCategory(.playback,mode:.default,options: [])
            try AVAudioSession.sharedInstance().setActive(true)
            BtaudioPlayer.play()
            
        }catch{
            print("Could not load file")
        }
        
        
    }
    
}
