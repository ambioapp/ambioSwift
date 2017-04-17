//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class HappyViewController: UIViewController {

    
    
    @IBAction func content(_ sender: Any) {
        content()
    }
    @IBAction func joyful(_ sender: Any) {
        joyful()
    }
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var moodText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/content")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
        moodText.text = "Lorem ipsum dolor sit amet, ea ius meliore dolorem fabellas. Odio clita deleniti id his, dicam dolore numquam mea ut, his et aliquip consequat assueverit."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func content(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/content")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }
    func joyful(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/joyful")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }

}
