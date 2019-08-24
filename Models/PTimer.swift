//
//  Timer.swift
//  Pomodoro Timer
//
//  Created by Justin Dodson on 8/20/19.
//  Copyright © 2019 Justin Dodson. All rights reserved.
//

import Foundation

class PomodoroTimer {
    
    var minutes : Int
    var seconds : Int
    var isRunning : Bool
    var minutessLeft : Int
    
    var timer = Timer()
    
    init(durationMinutes: Int) {
        self.minutes = durationMinutes
        self.seconds = 0
        self.isRunning = false
        self.minutessLeft = durationMinutes
    }
    
    // set the running state to true and start the timer
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementTime), userInfo: nil, repeats: false)
    }
    
    // set running state to false and invalidate the timer
    func pause() {
        isRunning = false
        timer.invalidate()
    }
    
    // set running state to false and reset all of the counters back to the beginning
    func restart() {
        isRunning = false
        timer.invalidate()
        minutessLeft = minutes
        seconds = 0
    }
    
    // return the current running state
    func isTimerRunning() -> Bool {
        return isRunning
    }
    
    // return the display string of the current time
    func currentTime() -> String {
        if minutessLeft < 10 {
            if seconds < 10 {
                return "0" + String(minutessLeft) + " : " + "0" + String(seconds)
            }
            else {
                return "0" + String(minutessLeft) + " : " + String(seconds)
            }
        }
        else {
            if seconds < 10 {
                return String(minutessLeft) + " : " + "0" + String(seconds)
            }
            else {
                return String(minutessLeft) + " : " + String(seconds)
            }
        }
    }
    
    
    // private functions
    
    // handle decrementing the time
    @objc private func decrementTime() {
        
    }
    
    
}
