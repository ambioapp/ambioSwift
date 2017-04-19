//
//  DetailController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var moodState = MyAppData.sharedData.moodTotal
    
    @IBAction func contact(_ sender: Any) {
        share()
    }
    @IBOutlet weak var moodVideo: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logo title and set color of nav  
        //logo title and set color of nav
        let titleView = UIView(frame: CGRect(x:0, y:0, width: 100, height:40))
        let titleImageView = UIImageView(image: UIImage(named: "logo-white.png"))
        titleImageView.frame = CGRect(x:0, y:0, width:titleView.frame.width, height:titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        //check which mood to display
        loadMood()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    //hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        loadMood()
    }
    
    func share(){
        let textToShare = "Hey I see your feeling \(moodState)."
        let objectsToShare:[AnyObject] = [textToShare as AnyObject]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
