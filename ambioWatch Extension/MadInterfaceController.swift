//
//  MadInterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class MadInterfaceController: WKInterfaceController {
    
    var url = Bundle.main.url(forResource: "p_angry", withExtension: "mov")
    
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    @IBOutlet var frustratedButton: WKInterfaceButton!
    @IBAction func frustratedPress() {
        frustrated()
    }
    @IBOutlet var angryButton: WKInterfaceButton!
    @IBAction func angryPress() {
        angry()
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
    
    func frustrated(){
        _ = Bundle.main.url(forResource: "p_angry", withExtension: "mov")
        frustratedButton.setBackgroundImageNamed("frustrated1.png")
        angryButton.setBackgroundImageNamed("angry2.png")
        playVideo()
    }
    func angry(){
        _ = Bundle.main.url(forResource: "p_angry", withExtension: "mov")
        frustratedButton.setBackgroundImageNamed("frustrated2.png")
        angryButton.setBackgroundImageNamed("angry1.png")
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
