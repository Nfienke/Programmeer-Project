//
//  WOView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//


import UIKit
import AVFoundation

class WOView: UIViewController {
    var identifier = String()
    //http://stackoverflow.com/questions/24393495/playing-a-sound-with-avaudioplayer
    //https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
    var audio: AVAudioPlayer!
    @IBOutlet weak var labelExercise: UILabel!
    //totalWO
    @IBOutlet weak var labelTotalRunTime: UILabel!
    @IBOutlet weak var labelTotalOverviewTime: UILabel!
    //wo
    @IBOutlet weak var labelRunTime: UILabel!
    @IBOutlet weak var labelOverviewTime: UILabel!
    
    //Timer
    // timer basics: https://www.youtube.com/watch?v=g_bc4nSGuI4
    var timerTotal = false
    var timerTotalWO = NSTimer()
    var min = Int64()
    var sec = 0
    var min2 = Int()
    var sec2 = 0
    
    @IBAction func breakButton(sender: UIButton) {
        if timerTotal == true{
            timerTotal = false
            onOffTimer()
        }
    }
    
    @IBAction func stopButton(sender: UIButton) {
        if timerTotal == true{
            timerTotal = false
        }
    }
    
    
    @IBAction func playButton(sender: UIButton) {
     
        if timerTotal == false{
            timerTotal = true
            onOffTimer()

        }
    }
    
    
    func onOffTimer() {
        if timerTotal == true{
            
            timerTotalWO = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "WOtimer", userInfo: nil, repeats: true)
        }
        
        if timerTotal == false {
            timerTotalWO.invalidate()
        }
    }
    
    //
    func WOtimer()->Bool{

        labelExercise.text! = WO.WOtype
        labelOverviewTime.text! = "\(String(format:"%02d", WO.timeWO)):00"
        
        labelTotalRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"
        labelRunTime.text! = "\(String(format:"%02d", min2)):\(String(format:"%02d", sec2))"//
        sec += 1
        sec2 += 1
        
            if sec == 60{
                sec = 0
                sec2 = 0
                min += 1
                min2 += 1
            }
            // Time of total work out has ended.
            if min == WO.timeTotal{
                if timerTotal == true{
                    timerTotal = false
                    onOffTimer()
                }
                playSound()
                performSegueWithIdentifier("End", sender: self)
               return false
                
            }
            
            //end of an exercise
            if min2 == WO.timeWO{
                playSound()
                min2 = 0
                WO.intIndex += 1
                WO.playWO()
            }
        return true
    }
    
    func playSound()    {
        
        let path = NSBundle.mainBundle().pathForResource("wosound", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)// is dit nodig? de path
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            audio = sound
            sound.play()
        }
        
        catch {
        // couldn't load file :(
        }
    }
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B4.png")!)
        //NSUserdefaults lade
        if NSUserDefaults.standardUserDefaults().objectForKey("NameWO") != nil{
            DB.valueNameWO = NSUserDefaults.standardUserDefaults().objectForKey("NameWO") as! String
            
        }
        DB.selectWOName()
        WO.playWO()
       
        labelExercise.text! = WO.WOtype
        
        // format: http://rshankar.com/simple-stopwatch-app-in-swift/
        labelTotalOverviewTime.text! = "\(String(format:"%02d", WO.timeTotal)):00"
        labelOverviewTime.text! = "\(String(format:"%02d", WO.timeWO)):00" //?
        labelTotalRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"
        labelRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"

    }
    
    
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}