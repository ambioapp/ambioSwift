//
//  SettingsViewController.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/14/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let whiteBar = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nav
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // nav border bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .black), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: whiteBar)
    }
    

}
