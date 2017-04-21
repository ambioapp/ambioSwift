//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class SadViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBAction func inconsolable(_ sender: Any) {
        gloomy()
    }
    @IBAction func depressed(_ sender: Any) {
        woeful()
    }
    @IBOutlet weak var inconsolableButton: UIButton!
    @IBOutlet weak var depressedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/depressed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        

        //button images default
        var image = UIImage(named: "gloomy1.png")
        inconsolableButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "woeful2.png")
        depressedButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gloomy(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/depressed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "gloomy1.png")
        inconsolableButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "woeful2.png")
        depressedButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    func woeful(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/inconsolable")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "gloomy2.png")
        inconsolableButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "woeful1.png")
        depressedButton.setBackgroundImage(image, for: UIControlState.normal)
    }

}
