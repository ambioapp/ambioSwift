//
//  Conn3InterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 5/4/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class Conn3InterfaceController: WKInterfaceController {

    @IBOutlet var moodVid: WKInterfaceInlineMovie!
    var url2 = Bundle.main.url(forResource: "p-anxious-1", withExtension: "mov")
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        playVideo()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func playVideo() {
        //setURL()
        url2 = Bundle.main.url(forResource: "p_anxious-1", withExtension: "mov")
        moodVid.setMovieURL(url2!)
        moodVid.setAutoplays(true)
        moodVid.setLoops(true)
        moodVid.play()
    }
}
