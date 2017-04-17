//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class AnxiousViewController: UIViewController {

    @IBOutlet weak var stressedButton: UIButton!
    @IBOutlet weak var restlessButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    @IBAction func restless(_ sender: Any) {
        restless()
    }
    @IBAction func stressed(_ sender: Any) {
        stressed()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/stressed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "stressed1.png")
        stressedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "restless2.png")
        restlessButton.setBackgroundImage(image, for: UIControlState.normal)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func restless(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/restless")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "stressed2.png")
        stressedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "restless1.png")
        restlessButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    func stressed(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/stressed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "stressed1.png")
        stressedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "restless2.png")
        restlessButton.setBackgroundImage(image, for: UIControlState.normal)
    }

}
