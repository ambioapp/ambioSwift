//
//  HappyInterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class HappyInterfaceController: WKInterfaceController {

    
    var url = Bundle.main.url(forResource: "p_happy-1", withExtension: "mov")
    
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    @IBOutlet var joyfullButton: WKInterfaceButton!
    @IBOutlet var contentButton: WKInterfaceButton!
    @IBAction func contentPress() {
        content()
    }
    @IBAction func joyfulPress() {
        joyful()
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
    
    func joyful(){
        url = Bundle.main.url(forResource: "p_happy-2", withExtension: "mov")
        joyfullButton.setBackgroundImageNamed("joyful1.png")
        contentButton.setBackgroundImageNamed("content2.png")
        playVideo()
    }
    func content(){
        url = Bundle.main.url(forResource: "p_happy-1", withExtension: "mov")
        joyfullButton.setBackgroundImageNamed("joyful2.png")
        contentButton.setBackgroundImageNamed("content1.png")
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
