//
//  ViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 2/22/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var moodState = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ambio"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecording))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        
        moodColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addRecording() {
        let vc = RecordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func moodColor(){
        if (moodState == 1)
        {
            view.backgroundColor = UIColor.black
        }
        if (moodState == 2)
        {
            view.backgroundColor = UIColor.blue
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

