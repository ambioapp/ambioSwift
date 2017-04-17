//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class CalmViewController: UIViewController {


    
    @IBAction func relaxed(_ sender: Any) {
        relaxed()
    }
    @IBAction func focused(_ sender: Any) {
        focused()
    }
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/relaxed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func relaxed(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/relaxed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }
    func focused(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/focused")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }

}
