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
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
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
    let whiteBar = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    let ambioPurple = UIColor(red: 144/255, green: 13/255, blue: 254/255, alpha: 1)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moodVideo: UIWebView!
    @IBAction func displayButton(_ sender: Any) {
        share()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logo title and set color of nav
        
        let titleView = UIView(frame: CGRect(x:0, y:0, width: 96.25, height:28))
        let widthLeft = (((self.view.frame.width/2)*(-1))+(0.90*titleView.frame.width))
        let titleImageView = UIImageView(image: UIImage(named: "logo.png"))
        titleImageView.frame = CGRect(x:widthLeft, y:(-4), width:titleView.frame.width, height:titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecording))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.view.backgroundColor = UIColor.black
        
        // nav border bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .black), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: whiteBar)
        
        //nav
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //check which mood to display
        loadMood()
        nameLabel.layer.zPosition = 10
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
        //let vc = RecordViewController()
        //navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func loadMood(){
        moodState = MyAppData.sharedData.moodTotal
        print(moodState)
        //let myWebView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        //myWebView.scrollView.isScrollEnabled = false;
        //myWebView.scrollView.bounces = false;
        moodVideo.scrollView.isScrollEnabled = false;
        moodVideo.scrollView.bounces = false;
        
        self.view.addSubview(moodVideo)
        if (moodState == "angry")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/angry")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "content")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/content")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "depressed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/depressed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "focused")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/focus")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "fustrated")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/fustrated")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "inconsolable")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/inconsolable")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "joyful")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/joyful")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "relaxed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/relaxed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "restless")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/restless")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "stressed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/stressed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        loadMood()
        if (WCSession.isSupported()) {
            watchMood()
            print("watch")
        }
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: whiteBar)
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
    
    func share(){
        let textToShare = "Hey I see your feeling \(moodState)."
        let objectsToShare:[AnyObject] = [textToShare as AnyObject]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }
    
}

