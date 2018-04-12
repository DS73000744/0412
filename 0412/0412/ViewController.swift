//
//  ViewController.swift
//  0412
//
//  Created by D7703_06 on 2018. 4. 12..
//  Copyright © 2018년 IceArrow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbTimer: UILabel!
    var count = 0
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateTime(){
        count = count + 1
        let min = count/60/100
        let sec = (count - (min*60*100)/100)
        let msec = count - (min * 60 * 100) - (sec * 100)
        lbTimer.text = String(format: "HH:mm:ss EE YYYY", min, sec, msec)
    }
    
    @IBAction func btStart(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
        changeButtonState (start: false, stop: true, reset: true)
    }
    @IBAction func btStop(_ sender: Any) {
        myTimer.invalidate()
        changeButtonState (start: true, stop: false, reset: true)
    }
    
    @IBAction func btReset(_ sender: Any) {
        myTimer.invalidate()
        lbTimer.text = "00:00:00"
        count = 0
        changeButtonState (start: true, stop: true, reset: false)
    }
    func changeButtonState(start: Bool, stop: Bool, reset: Bool){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

