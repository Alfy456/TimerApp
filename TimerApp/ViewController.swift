//
//  ViewController.swift
//  TimerApp
//
//  Created by user209728 on 1/11/22.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lapObj = laps[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapDetails") as? LapDetailsTableViewCell
        cell?.setLapCell(obj: lapObj)
        return cell!
    }
    

    @IBOutlet weak var lapTable: UITableView!
    @IBOutlet weak var btnLapReset: UIButton!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var timeHrMinSec: UILabel!
    var timeTxt : String = ""
    
    var timer : Timer = Timer()
    var count:Int = 0//Initialing the time to 0
    var timerCounting:Bool = false//first check whether the timer is ON
    var lapReset:Bool = false
    
    var lapList = [Lap]()
    var laps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Initalising the start stop button and changing the color to green on load
        btnStartStop.setTitleColor(UIColor.green, for: .normal)
        lapTable.dataSource = self
        lapTable.delegate = self
        lapTable.rowHeight = 60
        lapTable.tableFooterView = UIView()
        
    }

    @IBAction func btnStartStop(_ sender: Any) {
        
        //checking whether the timer is ON or OFF
        if(timerCounting){//if true
            timerCounting = false
            timer.invalidate()
            btnStartStop.setTitle("START", for: .normal)
            btnStartStop.setTitleColor(UIColor.black, for: .normal)
            btnLapReset.setTitle("RESET", for: .normal)
            
            
            
        }else{//if false
            timerCounting = true
            btnStartStop.setTitle("STOP", for: .normal)
            btnStartStop.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1
                                         , target: self, selector:#selector(timerCounter), userInfo: nil, repeats: true)
            laps.append(timeTxt)
            print(laps)
            
                   }
        
    }
    
    @IBAction func btnResetLap(_ sender: Any) {
        if(lapReset){
           lapReset = false
            self.count = 0
            self.timer.invalidate()
            self.timeHrMinSec.text = self.makeTImeString(hours: 0
                            , min: 0, sec: 0)
            self.btnLapReset.setTitle("LAP", for: .normal)
            self.btnLapReset.setTitleColor(UIColor.black, for: .normal)
                 
            
        }else{
                lapReset = true
           
          
                lapTable.reloadData()
        }
        
        
        
    }
    
    @objc func timerCounter()->Void{
        count = count + 1
        let time = secondsToHoursMinuSec(seconds: count)
        let timeString = makeTImeString(hours: time.0, min: time.1, sec: time.2)
    
        timeHrMinSec.text = timeString
        timeTxt = timeString
       
    }
    
    func secondsToHoursMinuSec(seconds :Int)->(Int,Int,Int){
        return ((seconds/3600),((seconds%3600)/60),((seconds%3600)%60))
    }
    
    func makeTImeString(hours:Int,min:Int,sec:Int)->String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", min)
        timeString += " : "
        timeString += String(format: "%02d", sec)
        return timeString
        
    }
}
