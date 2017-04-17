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
    @IBOutlet weak var moodText: UILabel!
    @IBAction func inconsolable(_ sender: Any) {
        inconsolable()
    }
    @IBAction func depressed(_ sender: Any) {
        depressed()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

        
        //video
        webView.scrollView.isScrollEnabled = false;
        webView.scrollView.bounces = false;
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/inconsolable")
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
    
    func inconsolable(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/inconsolable")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }
    func depressed(){
        let myURL = URL(string: "http://chasbrouck.io/moodNoise/depressed")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }

}
