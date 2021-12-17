//
//  ViewController.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var sleeping: UIButton!
    @IBOutlet weak var wakeUp: UIButton!
    let alarm = Alarm()
    let BnSd = ButtonSound()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if alarm.sleepTimer != nil{
            alarm.alarmStop()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var myDPvar: UIDatePicker!
    
    private var tempTime: String = "00:00"
    private var setTime: String = "00:00"
    
    @IBAction func myDPfunc(sender: AnyObject) {
        print("test: myDP moved!")
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        tempTime = format.string(from: myDPvar.date)
    }
    
    @IBAction func myButtonfunc(sender: AnyObject) {
        alarm.selectedWakeUpTime = myDPvar.date
        alarm.runTimer()
        setTime = tempTime
        BnSd.buttonSound()
        sleeping.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        print("test: myButton Pushed!")
    }
    
    func getNowTime()-> String {
        let nowTime: NSDate = NSDate()
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.string(from: nowTime as Date)
        return nowTimeStr
    }
    
    func update() {
        let str = getNowTime()
        myLabel.text = str
        myAlarm(str: str)
    }
    
    func myAlarm(str: String) {
        if str == setTime{
            alarm.alarmPlay()
        }
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        alarm.alarmStop()
        BnSd.buttonSound()
        wakeUp.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            self.performSegue(withIdentifier: "shake", sender: nil)
        }
        print("test: stopAction Pushed!")
        
        
    }
    
    func updateTime(_ time:String) {
        myLabel.text = time
    }
    @objc func buttonTapped(sender:UIButton) {
        animateView(sender)
    }
    
    func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }) { (_) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                viewToAnimate.transform = .identity
                
            }, completion: nil)
        }
    }
    
}
