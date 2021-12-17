//
//  Vib.swift
//  goodbyeSleepTwice
//
//  Created by enPiT2016MBP-09 on 2021/12/17.
//

import Foundation
import AudioToolbox

var vibCount = 5

class Vib{
    
func startVibrateInterval() {
        
        // どのバイブレーションを鳴らすか
        let systemSoundID = SystemSoundID(kSystemSoundID_Vibrate)
        
        // 繰り返し用のコールバックをセット
        AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, { (systemSoundID, nil) -> Void in
            
            vibCount =  vibCount - 1
            
            if ( vibCount > 0 ) {
                // 繰り返し再生
                AudioServicesPlaySystemSound(systemSoundID)
            }
            else {
                // コールバックを解除
                AudioServicesRemoveSystemSoundCompletion(systemSoundID)
            }
            
        }, nil)
        
        // 初回のバイブレーションを鳴らす
        AudioServicesPlaySystemSound(systemSoundID)
        
    }
}


