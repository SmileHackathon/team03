//
//  Swing.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import Foundation
import AVFoundation
class SwingSound{
    var SwaudioPlayer = AVAudioPlayer()
    func swingSound(){
        let SwS = Bundle.main.bundleURL.appendingPathComponent("Motion-Swish03-1.mp3")
        
        do{
            //audioPlayer = try AVAudioPlayer(contentsOf: sound,fileTypeHint: nil)
            SwaudioPlayer = try AVAudioPlayer(contentsOf: SwS)
            try AVAudioSession.sharedInstance().setCategory(.playback,mode:.default,options: [])
            try AVAudioSession.sharedInstance().setActive(true)
            SwaudioPlayer.play()
            
        }catch{
            print("Could not load file")
        }
        
        
    }
    
}
