//
//  AnxiousViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/16/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class AnxiousViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBAction func restless(_ sender: Any) {
        restless()
    }
    @IBAction func stressed(_ sender: Any) {
        stressed()
    }
    @IBOutlet weak var moodText: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/restless")
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
    
    func restless(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/restless")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }
    func stressed(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/stressed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }

}
