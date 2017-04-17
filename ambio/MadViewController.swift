//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class MadViewController: UIViewController {



    
    @IBAction func angry(_ sender: Any) {
        angry()
    }
    @IBAction func frustrated(_ sender: Any) {
        frustrated()
    }
  
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/angry")
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
    
    func angry(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/angry")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }
    func frustrated(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/fustrated")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }

}
