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
    @IBOutlet weak var relaxedButton: UIButton!
    @IBOutlet weak var focusedButton: UIButton!
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
        
        //button images default
        var image = UIImage(named: "relaxed1.png")
        relaxedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "focused2.png")
        focusedButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func relaxed(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/relaxed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "relaxed1.png")
        relaxedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "focused2.png")
        focusedButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    func focused(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/focused")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "relaxed2.png")
        relaxedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "focused1.png")
        focusedButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // nav border bottom
        let blackBar = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .black), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: blackBar)
    }

}
