//
//  Connection2DetailController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/27/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class Connection2DetailController: WKInterfaceController {

    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        playVideo()
        setTitle("< Julianne")
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
        let url2 = Bundle.main.url(forResource: "p_happy-2", withExtension: "mov")
        moodVideo.setMovieURL(url2!)
        moodVideo.setAutoplays(true)
        moodVideo.setLoops(true)
        moodVideo.play()
    }

}
