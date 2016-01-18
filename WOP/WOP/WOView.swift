//
//  WOView.swift
//  WOP
//
//  Created by Nienke Pot on 06-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class WOView: UIViewController {
    
    //http://stackoverflow.com/questions/24393495/playing-a-sound-with-avaudioplayer
    //https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
    var audio: AVAudioPlayer!
    
    @IBOutlet weak var labelTotalRunTime: UILabel!
    @IBOutlet weak var LabelTotalOverviewTime: UILabel!
    
    @IBAction func breakButton(sender: UIButton) {
        if timerTotal == true{
            timerTotal = false
            onOffTimer()
            let path = NSBundle.mainBundle().pathForResource("wosound.mp3", ofType:nil)!
            let url = NSURL(fileURLWithPath: WOP)
            
            do {
                let sound = try AVAudioPlayer(contentsOfURL: url)
                bombSoundEffect = sound
                sound.play()
            } catch {
                // couldn't load file :(
            }

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
    
    var min = 0
    var sec = 0
    var timerTotalWO = NSTimer()
    var timerTotal = false
    
    // timer basics: https://www.youtube.com/watch?v=g_bc4nSGuI4
    
    func WOtimer() {
        sec += 1
        if sec == 60{
            sec = 0
            min += 1
            
        }
        // Time of total work out has ended.
        if min == WO.timeTotal{
            timerTotalWO.invalidate()
            timerTotal = false
            //segue to WOEndView
        }
        labelTotalRunTime.text! = "\(String(format:"%02d", min)):\(String(format:"%02d", sec))"     // format: http://rshankar.com/simple-stopwatch-app-in-swift/
    }

    func onOffTimer() {
        if timerTotal == true{
            timerTotalWO = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:Selector("WOtimer"), userInfo: nil, repeats: true)
            
        }
        if timerTotal == false {
            self.timerTotalWO.invalidate()
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "B4.png")!)
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}