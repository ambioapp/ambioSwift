//
//  CalmInterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class CalmInterfaceController: WKInterfaceController {
    
    var url = Bundle.main.url(forResource: "p_energetic-1", withExtension: "mov")
    
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    @IBOutlet var relaxedButton: WKInterfaceButton!
    @IBAction func relaxedPressed() {
        relaxed()
    }
    @IBOutlet var focusedButton: WKInterfaceButton!
    
    @IBAction func focusedPressed() {
        focused()
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        playVideo()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func relaxed(){
        url = Bundle.main.url(forResource: "p_energetic-1", withExtension: "mov")
        relaxedButton.setBackgroundImageNamed("relaxed1.png")
        focusedButton.setBackgroundImageNamed("focused2.png")
        playVideo()
    }
    func focused(){
        url = Bundle.main.url(forResource: "p_energetic-2", withExtension: "mov")
        relaxedButton.setBackgroundImageNamed("relaxed2.png")
        focusedButton.setBackgroundImageNamed("focused1.png")
        playVideo()
    }
    func playVideo() {
        //setURL()
        moodVideo.setMovieURL(url!)
        moodVideo.setAutoplays(true)
        moodVideo.setLoops(true)
        moodVideo.play()
    }

}
