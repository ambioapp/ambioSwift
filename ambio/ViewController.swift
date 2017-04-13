//
//  ViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 2/22/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit
import WatchConnectivity


//border botto extension
extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 2.0)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

class ViewController: UIViewController, WCSessionDelegate{
    
    var session: WCSession!
    var moodState = MyAppData.sharedData.moodTotal
    let ambioPurple = UIColor(red: 144/255, green: 13/255, blue: 254/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logo title and set color of nav
        let titleView = UIView(frame: CGRect(x:0, y:0, width: 100, height:40))
        let titleImageView = UIImageView(image: UIImage(named: "logo-white.png"))
        titleImageView.frame = CGRect(x:0, y:0, width:titleView.frame.width, height:titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecording))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.view.backgroundColor = UIColor.black
        
        // nav border bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .black), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: ambioPurple)
        
        //check which mood to display
        loadMood()
        
        if (WCSession.isSupported()) {
            session = WCSession.default()
            session.delegate = self;
            session.activate()
            print("WCSession is activated")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addRecording() {
        let vc = RecordViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func loadMood(){
        moodState = MyAppData.sharedData.moodTotal
        print(moodState)
        let myWebView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        myWebView.scrollView.isScrollEnabled = false;
        myWebView.scrollView.bounces = false;
        self.view.addSubview(myWebView)
        if (moodState == "angry")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/angry")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "content")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/content")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "depressed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/depressed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "focused")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/focus")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "fustrated")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/fustrated")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "inconsolable")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/inconsolable")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "joyful")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/joyful")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "relaxed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/relaxed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "restless")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/restless")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == "stressed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/stressed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
    }
    
    //hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        loadMood()
        watchMood()
    }
    
    //protocals for watch session
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?){
        
    }
    func sessionDidBecomeInactive(_ session: WCSession){
        
    }
    func sessionDidDeactivate(_ session: WCSession){
        
    }
    
    //send mood to watch
    func watchMood() {
    
        // send a message to the watch if it's reachable
        let messageToSend = ["Mood":MyAppData.sharedData.moodTotal]
        session.sendMessage(messageToSend, replyHandler: { replyMessage in
            //handle and present the message on screen
            _ = replyMessage["Value"] as? String
        }, errorHandler: {error in
            // catch any errors here
            print(error)
        })


    }
}

