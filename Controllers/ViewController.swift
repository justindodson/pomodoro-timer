//
//  ViewController.swift
//  Pomodoro Timer
//
//  Created by Justin Dodson on 8/20/19.
//  Copyright © 2019 Justin Dodson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // instance variables
    var isTimerRunning : Bool = false
    var isFocusTime : Bool = true
    var seconds : Int = 0
    var breakMinutes : Int = 0
    var focusMinutes : Int = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // build timer
        breakMinutes = 5
        focusMinutes = 25
        
        // Add settings icon to nav bar
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 5)
        progressBar.progress = 0
        
        let settingsBtn = UIButton(type: .custom)
        settingsBtn.setImage(UIImage(named: "settings.png"), for: .normal)
        
        settingsBtn.addTarget(self, action: #selector(settingsBtnPressed), for: .touchUpInside)
        settingsBtn.frame = CGRect(x:0, y:0, width: 25, height: 25)
        
        let rightBtn = UIBarButtonItem(customView: settingsBtn)
        navBar.rightBarButtonItem = rightBtn
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        print("Play")
        isTimerRunning = !isTimerRunning
        
        if(isTimerRunning) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimerUI), userInfo: nil, repeats: true)
            let image = UIImage(named: "pause.png")
            playPauseBtn.setBackgroundImage(image, for: .normal)
        } else {
            timer.invalidate()
            let image = UIImage(named: "play.png")
            playPauseBtn.setBackgroundImage(image, for: .normal)
        }
    }
    
    @IBAction func fastForwardPressed(_ sender: Any) {
        print("FastForward")
    }

    @objc func settingsBtnPressed() {
        print("settings menu called")
    }
    
    @objc func updateTimerUI() {
        
        if isFocusTime {
            // work timer manager method
        }
        else {
            // break timer manager
        }
        
        seconds -= 1
        
        if seconds < 0 {
            seconds = 59
            
            focusMinutes -= 1
            if focusMinutes < 0 {
                // switch to break timer
            }
        }
        
        timerLabel.text = String(focusMinutes) + " : " + String(seconds)
        
    }
    
    // private methods
    private func workTimerUpdate() {
        
    }

}

