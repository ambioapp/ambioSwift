//
//  Connection2Controller.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/26/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class Connection3Controller: WKInterfaceController {


    
  
    @IBOutlet var nameButton: WKInterfaceButton!
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        nameButton.setTitle("Mom")
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
        let url2 = Bundle.main.url(forResource: "p_anxious-1", withExtension: "mov")
        moodVideo.setMovieURL(url2!)
        moodVideo.setAutoplays(true)
        moodVideo.setLoops(true)
        moodVideo.play()
    }

}
