//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class MadViewController: UIViewController {



    @IBOutlet weak var frustratedButton: UIButton!
    
    @IBAction func frustrated(_ sender: Any) {
        frustrated()
    }
    @IBOutlet weak var angryButton: UIButton!
    @IBAction func angry(_ sender: Any) {
        angry()
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
        
        //button images default
        var image = UIImage(named: "frustrated1.png")
        frustratedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "angry2.png")
        angryButton.setBackgroundImage(image, for: UIControlState.normal)
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
        
        //button images default
        var image = UIImage(named: "frustrated2.png")
        frustratedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "angry1.png")
        angryButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    func frustrated(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/fustrated")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        
        //button images default
        var image = UIImage(named: "frustrated1.png")
        frustratedButton.setBackgroundImage(image, for: UIControlState.normal)
        image = UIImage(named: "angry2.png")
        angryButton.setBackgroundImage(image, for: UIControlState.normal)
    }

}
