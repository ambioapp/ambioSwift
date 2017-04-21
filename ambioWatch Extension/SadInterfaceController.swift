//
//  SadInterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class SadInterfaceController: WKInterfaceController {
    
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    var url = Bundle.main.url(forResource: "p_sad-1", withExtension: "mov")
    
    @IBOutlet var gloomyButton: WKInterfaceButton!
    @IBAction func gloomyPress() {
        gloomy()
    }
    @IBOutlet var woefulButton: WKInterfaceButton!
    @IBAction func woefulPress() {
        woeful()
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
    
    func gloomy(){
        url = Bundle.main.url(forResource: "p_sad-1", withExtension: "mov")
        gloomyButton.setBackgroundImageNamed("gloomy1.png")
        woefulButton.setBackgroundImageNamed("woeful2.png")
        playVideo()
    }
    func woeful(){
        url = Bundle.main.url(forResource: "p_sad-2", withExtension: "mov")
        gloomyButton.setBackgroundImageNamed("gloomy2.png")
        woefulButton.setBackgroundImageNamed("woeful1.png")
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
