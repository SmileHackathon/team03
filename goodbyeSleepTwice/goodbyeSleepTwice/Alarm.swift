//
//  Alarm.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import Foundation
import AVFoundation
class Alarm{
    var selectedWakeUpTime:Date?
    var audioPlayer = AVAudioPlayer()
    var sleepTimer: Timer?
    var seconds = 0
    
    func runTimer(){
        //calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        
        if sleepTimer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(alarmPlay), userInfo: nil, repeats: true)
        }
    }
    
    @objc func alarmPlay(){
        
        if seconds != 0{
            //secondsから-1する
            seconds -= 1
        }else{
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
            let Path = Bundle.main.bundleURL.appendingPathComponent("Clock-Alarm05-1.mp3")
            
            do{
                //audioPlayer = try AVAudioPlayer(contentsOf: sound,fileTypeHint: nil)
                audioPlayer = try AVAudioPlayer(contentsOf: Path)
                try AVAudioSession.sharedInstance().setCategory(.playback,mode:.default,options: [])
                try AVAudioSession.sharedInstance().setActive(true)
                audioPlayer.numberOfLoops = -1
                audioPlayer.play()
                
            }catch{
                print("Could not load file")
            }
            
            
        }
    }
    private func calculateInterval(userAwakeTime:Date)-> Int{
        //タイマーの時間を計算する
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        
        if interval < 0{
            //落とし穴 ②の解決策
            interval = 86400 - (0 - interval)
        }
        //落とし穴 ③の解決策
        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
    
    func alarmStop(){
        //sleepTimerがnilじゃない場合
        if sleepTimer != nil {
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
        }else{
            //タイマーを止める
            audioPlayer.stop()
        }
    }
    
    
}


