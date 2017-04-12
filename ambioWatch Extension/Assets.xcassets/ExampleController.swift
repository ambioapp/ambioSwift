//
//  ExampleController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/11/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

//
//  InterfaceController.swift
//  ambioWatch Extension
//
//  Created by Conner Hasbrouck on 4/5/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class ExampleController: WKInterfaceController, WCSessionDelegate {
    
    //session for iphone connection
    var session : WCSession!
    
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    @IBOutlet var nameLabel: WKInterfaceLabel!
    
    //app state saving
    var moodState = watchAppData.sharedData.moodTotal
    
    //url for video
    var url2 = Bundle.main.url(forResource: "default", withExtension: "mov")
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default()
            session.delegate = self
            session.activate()
            print("WCSession activated")
        }
        
        //setURL()
        playVideo()
        
        //load last mood label
        self.nameLabel.setText("Conner")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void){
        let mood = message["Mood"] as? String
        watchAppData.sharedData.moodTotal = mood!
        playVideo()
    }
    
    func setURL() {
        if (moodState == "angry"){
            url2 = Bundle.main.url(forResource: "p_angry", withExtension: "mov")
        }
        if (moodState == "content")
        {
            url2 = Bundle.main.url(forResource: "p_content", withExtension: "mov")
        }
        if (moodState == "depressed")
        {
            url2 = Bundle.main.url(forResource: "p_depressed", withExtension: "mov")
        }
        if (moodState == "focused")
        {
            url2 = Bundle.main.url(forResource: "p_focused", withExtension: "mov")
        }
        if (moodState == "fustrated")
        {
            url2 = Bundle.main.url(forResource: "p_fustrated", withExtension: "mov")
        }
        if (moodState == "inconsolable")
        {
            url2 = Bundle.main.url(forResource: "p_inconsolable", withExtension: "mov")
        }
        if (moodState == "joyful")
        {
            url2 = Bundle.main.url(forResource: "p_joyful", withExtension: "mov")
        }
        if (moodState == "relaxed")
        {
            url2 = Bundle.main.url(forResource: "p_relaxed", withExtension: "mov")
        }
        if (moodState == "restless")
        {
            url2 = Bundle.main.url(forResource: "p_restless", withExtension: "mov")
        }
        if (moodState == "stressed")
        {
            url2 = Bundle.main.url(forResource: "p_stressed", withExtension: "mov")
        }
    }
    
    func playVideo() {
        //setURL()
        url2 = Bundle.main.url(forResource: "p_angry", withExtension: "mov")
        moodVideo.setMovieURL(url2!)
        moodVideo.setAutoplays(true)
        moodVideo.setLoops(true)
        moodVideo.play()
    }
}
