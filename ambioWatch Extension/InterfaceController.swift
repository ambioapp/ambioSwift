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

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    //session for iphone connection
    var session : WCSession!
    
    //app state saving
    var moodState = watchAppData.sharedData.moodTotal
    
    //url for video
    var url2 = Bundle.main.url(forResource: "default", withExtension: "mov")
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    @IBOutlet weak var moodVideo: WKInterfaceInlineMovie!
    
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
        self.moodLabel.setText(watchAppData.sharedData.moodTotal)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    /*func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any], replyHandler: ([String : AnyObject]) -> Void){
       print("hit")
        moodLabel.setText("change")
    }*/
    
    /*private func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: @escaping ([String : AnyObject]) -> Void) {
        _ = message["Message"] as? String
        DispatchQueue.main.async() {
            // do something
            self.moodLabel.setText("change")
        }
        
        replyHandler(["Message":"Oh yeah!" as AnyObject])
    }*/
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void){
        let mood = message["Mood"] as? String
        watchAppData.sharedData.moodTotal = mood!
        self.moodLabel.setText(watchAppData.sharedData.moodTotal)
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
