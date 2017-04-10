//
//  watchAppData.swift
//  ambio
//
//  Created by Conner Hasbrouck on 4/10/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import Foundation

class watchAppData{
    
    let moodKey = "counterKey"
    
    static let sharedData = watchAppData()
    var moodTotal:String = "content"{
        didSet{
            let defaults = UserDefaults.standard
            defaults.set(moodTotal, forKey: moodKey)
        }
    }
    
    private init(){
        readDeafultsData()
    }
    
    private func readDeafultsData(){
        let defaults = UserDefaults.standard
        //moodTotal = defaults.string(forKey: moodKey)!
        
        if let s = defaults.object(forKey: moodKey){
            moodTotal = s as! String
        }else{
            moodTotal = "default"
        }
    }
}
