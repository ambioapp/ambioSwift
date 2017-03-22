//
//  MyAppData.swift
//  ambio
//
//  Created by Conner Hasbrouck on 3/22/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import Foundation

class MyAppData{
    
    let moodKey = "counterKey"
    
    static let sharedData = MyAppData()
    var moodTotal:Int = 1{
        didSet{
            let defaults = UserDefaults.standard
            defaults.set(moodTotal, forKey: moodKey)
        }
    }

    private init(){
        print("Created MyAppData instance")
        readDeafultsData()
    }
    
    private func readDeafultsData(){
        let defaults = UserDefaults.standard
        moodTotal = defaults.integer(forKey: moodKey)
    }
}
