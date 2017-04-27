//
//  DetailInterfaceController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {
    
    //app state saving
    var moodState = watchAppData.sharedData.moodTotal
    var url2 = Bundle.main.url(forResource: "default", withExtension: "mov")
    
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        setURL()
        playVideo()
        setTitle("< Conner")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setURL() {
        if (moodState == "angry"){
            url2 = Bundle.main.url(forResource: "p_mad-1", withExtension: "mov")
        }
        if (moodState == "content")
        {
            url2 = Bundle.main.url(forResource: "p_happy-1", withExtension: "mov")
        }
        if (moodState == "depressed")
        {
            url2 = Bundle.main.url(forResource: "p_sad-1", withExtension: "mov")
        }
        if (moodState == "focused")
        {
            url2 = Bundle.main.url(forResource: "p_energetic-2", withExtension: "mov")
        }
        if (moodState == "fustrated")
        {
            url2 = Bundle.main.url(forResource: "p_mad-2", withExtension: "mov")
        }
        if (moodState == "inconsolable")
        {
            url2 = Bundle.main.url(forResource: "p_sad-2", withExtension: "mov")
        }
        if (moodState == "joyful")
        {
            url2 = Bundle.main.url(forResource: "p_happy-2", withExtension: "mov")
        }
        if (moodState == "relaxed")
        {
            url2 = Bundle.main.url(forResource: "p_energetic-1", withExtension: "mov")
        }
        if (moodState == "restless")
        {
            url2 = Bundle.main.url(forResource: "p_anxious-1", withExtension: "mov")
        }
        if (moodState == "stressed")
        {
            url2 = Bundle.main.url(forResource: "p_anxious-2", withExtension: "mov")
        }
    }
    
    func playVideo() {
        setURL()
        moodVideo.setMovieURL(url2!)
        moodVideo.setAutoplays(true)
        moodVideo.setLoops(true)
        moodVideo.play()
    }

}
