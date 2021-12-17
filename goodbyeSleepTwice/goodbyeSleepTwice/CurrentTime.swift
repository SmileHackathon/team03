//
//  CurrentTime.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import Foundation
class CurrentTime{
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: ViewController?
    
    init() {
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateCurrentTime(){
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone.current
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
    
    
    
}

