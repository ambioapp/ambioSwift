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
    
    var session : WCSession!
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    @IBOutlet var moodVideo: WKInterfaceInlineMovie!
    
    
    
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
        
        let url = Bundle.main.url(forResource: "movieclip", withExtension: "mov")
        
        //let options = [WKMediaPlayerControllerOptionsAutoplayKey : "true"]
        
        //moodVideo.setMovieURL(url!)
        moodVideo.setMovieURL(url!)
        moodVideo.setLoops(true)
        moodVideo.play()
        
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
        self.moodLabel.setText(mood)
    }
}
