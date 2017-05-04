//
//  ConnectionDetailViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/19/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class Connection3DetailViewController: UIViewController {

    @IBAction func displayButton(_ sender: Any) {
        share()
    }

    @IBAction func contactButton(_ sender: Any) {
        share()
    }
   
    var moodState = MyAppData.sharedData.moodTotal
    let blackBar = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    let clear = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    let greenColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    
    @IBOutlet weak var moodVideo: UIWebView!
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logo title and set color of nav
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 28)!, NSForegroundColorAttributeName: UIColor.white]
        var image = UIImage(named: "weather-icon-rainy.png")
        image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.isEnabled = false;
        self.navigationItem.rightBarButtonItem?.tintColor = greenColor;
        
        //check which mood to display
        loadMood()
        
        //time
        //time
        let timeDifference = 4
        let date = Date()
        let calendar = Calendar.current
        var hour = ((calendar.component(.hour, from: date)) - timeDifference)
        if (hour < 0) {
            hour = ((24+(calendar.component(.hour, from: date))) - timeDifference)
        }
        let minutes = calendar.component(.minute, from: date)
        _ = calendar.component(.second, from: date)
        let fulltime = "\(hour):\(minutes)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        let date12 = dateFormatter.date(from: fulltime)!
        dateFormatter.dateFormat = "h:mm a"
        let date22 = dateFormatter.string(from: date12)
        timeLabel.text = date22
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMood(){
        moodState = "restless"
        //let myWebView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        //myWebView.scrollView.isScrollEnabled = false;
        //myWebView.scrollView.bounces = false;
        moodVideo.scrollView.isScrollEnabled = false;
        moodVideo.scrollView.bounces = false;
        
        self.view.addSubview(moodVideo)
        if (moodState == "angry")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/angry")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "content")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/content")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "depressed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/depressed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "focused")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/focused")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "fustrated")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/fustrated")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "inconsolable")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/inconsolable")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "joyful")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/joyful")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "relaxed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/relaxed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "restless")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/restless")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
        if (moodState == "stressed")
        {
            let myURL = URL(string: "http://chasbrouck.io/moodNoise/stressed")
            let myURLRequest:URLRequest = URLRequest(url: myURL!)
            moodVideo.loadRequest(myURLRequest)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadMood()
        // nav border bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: clear), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: clear)
    }
    
    func share(){
        let textToShare = "Hey I see your feeling \(moodState)."
        let objectsToShare:[AnyObject] = [textToShare as AnyObject]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }


}
