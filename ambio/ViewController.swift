//
//  ViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 2/22/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var moodState = MyAppData.sharedData.moodTotal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo-white.png")
        imageView.image = image
        navigationItem.titleView = imageView
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecording))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "update", style: .plain, target: self, action: #selector(loadMood))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        //check which mood to display
        loadMood()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addRecording() {
        let vc = RecordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadMood(){
        moodState = MyAppData.sharedData.moodTotal
        print(moodState)
        let myWebView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        myWebView.scrollView.isScrollEnabled = false;
        myWebView.scrollView.bounces = false;
        self.view.addSubview(myWebView)
        if (moodState == 0)
        {
            
        }
        if (moodState == 1)
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/content")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == 2)
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/angry")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            myWebView.loadRequest(myURLRequest)
        }
        if (moodState == 3)
        {
            view.backgroundColor = UIColor.green
        }
        if (moodState == 4)
        {
            view.backgroundColor = UIColor.yellow
        }
        if (moodState == 5)
        {
            view.backgroundColor = UIColor.red
        }
    }

}

