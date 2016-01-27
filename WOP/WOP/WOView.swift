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
    
    var WO = WOPlay()
   
    //Audio.
    var audio: AVAudioPlayer!
    
    // Buttons.
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var breaking: UIButton!
    @IBOutlet weak var play: UIButton!
    
    //Labels of the work out info.
    @IBOutlet weak var labelTotalRunTime: UILabel!
    @IBOutlet weak var labelTotalOverviewTime: UILabel!
    
    //Labels of the exercise info.
    @IBOutlet weak var labelExercise: UILabel!
    @IBOutlet weak var labelRunTime: UILabel!
    @IBOutlet weak var labelOverviewTime: UILabel!
    
    //Timer: https://www.youtube.com/watch?v=g_bc4nSGuI4
    var timerTotal = false
    var timerTotalWO = NSTimer()
    var min = Int64()
    var sec = 0
    var min2 = Int()
    var sec2 = 0
    
    //Shows the play and stop button when work out is stopped.
   func breakModeButtons() {
        play.hidden = false
        stop.hidden = false
        breaking.hidden = true
    }
    
    // Shows the break button when work out is played.
    func playModeButtons()  {
        play.hidden = true
        stop.hidden = true
        breaking.hidden = false
    }
    
    @IBAction func breakButton(sender: UIButton) {
        
        if timerTotal {
            timerTotal = false
            onOffTimer()
            breakModeButtons()
        }
    }
    
    @IBAction func stopButton(sender: UIButton) {
       timerTotal = !timerTotal
    }
    
    @IBAction func playButton(sender: UIButton) {
        
        if timerTotal == false {
            timerTotal = true
            onOffTimer()
            playModeButtons()
        }
    }
    
    // Checks whether the timer is running or not.
    func onOffTimer() {
        
        if timerTotal {
            timerTotalWO = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "WOtimer", userInfo: nil, repeats: true)
        }
        
        if timerTotal == false {
            timerTotalWO.invalidate()
        }
    }
    
    //Plays and displays the work out.
    func WOtimer() -> Bool {

        labelExercise.text! = WO.WOtype
        labelOverviewTime.text! = "\(String(format:"%02d", WO.timeWO)):00"
        labelTotalRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"
        labelRunTime.text! = "\(String(format:"%02d", min2)):\(String(format:"%02d", sec2))"
        
        sec += 1
        sec2 += 1
        
        //Calculates secondes to minutes.
        if sec == 60 {
            sec = 0
            sec2 = 0
            min += 1
            min2 += 1
        }
        
        //End of the complete work out -> segue to end WOEndView.
        if min == WO.timeTotal {
            
            if timerTotal {
                timerTotal = false
                onOffTimer()
            }
            playSound()
            performSegueWithIdentifier("End", sender: self)
            return false
        }
        
        //The end of an exercise -> break.
        if min2 == WO.timeWO {
            
            if timerTotal {
                timerTotal = false
                breakModeButtons()
                onOffTimer()
            }
            
            playSound()
            min2 = 0
            WO.intIndex += 1
            WO.playWO()
        }
        return true
    }
    
    //http://stackoverflow.com/questions/24393495/playing-a-sound-with-avaudioplayer
    //https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
    // Plays an sound when an exercise is completed.
    func playSound() {
        
        let path = NSBundle.mainBundle().pathForResource("wosound", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            audio = sound
            sound.play()
        }
        catch {
            print("Could not play: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B4.png")!)
        
        //NSUserdefaults loading: previous chosen work out.
        if NSUserDefaults.standardUserDefaults().objectForKey("NameWO") != nil{
            DBModel.sharedInstance.valueNameWO = NSUserDefaults.standardUserDefaults().objectForKey("NameWO") as! String
        }
        
        DBModel.sharedInstance.selectWOName()
        WO.playWO()
       
        labelExercise.text! = WO.WOtype
        
        //Format: http://rshankar.com/simple-stopwatch-app-in-swift/
        labelTotalOverviewTime.text! = "\(String(format:"%02d", WO.timeTotal)):00"
        labelOverviewTime.text! = "\(String(format:"%02d", WO.timeWO)):00" //?
        labelTotalRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"
        labelRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"
        
        play.hidden = false
        stop.hidden = false
        breaking.hidden = true
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}