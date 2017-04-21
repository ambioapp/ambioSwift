//
//  AnxiousInterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class AnxiousInterfaceController: WKInterfaceController {
    
    var url = Bundle.main.url(forResource: "p_anxious-2", withExtension: "mov")
    
    
    @IBOutlet var stressedButton: WKInterfaceButton!
    @IBOutlet var restlessButton: WKInterfaceButton!

    @IBAction func stressedPressed() {
        stressed()
    }
    @IBAction func restlessPressed() {
        restless()
    }
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
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
    
    func restless(){
        url = Bundle.main.url(forResource: "p_anxious-1", withExtension: "mov")
        restlessButton.setBackgroundImageNamed("restless1.png")
        stressedButton.setBackgroundImageNamed("stressed2.png")
        playVideo()
    }
    func stressed(){
        url = Bundle.main.url(forResource: "p_anxious-2", withExtension: "mov")
        restlessButton.setBackgroundImageNamed("restless2.png")
        stressedButton.setBackgroundImageNamed("stressed1.png")
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
