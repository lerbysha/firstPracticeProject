//
//  Task.swift
//  SelfCreator
//
//  Created by itisioslab on 12.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import Foundation
class Task: NSObject, NSCoding {
    
    var name:String
    var count:Int
    var progress:[String: Int]
    
    init(name: String, count: Int){
        self.name = name
        self.count = count
        self.progress = [:]
        let data = DataBaseManager()
        let date = data.getDate(date: Date())
        self.progress[date] = 0
    }
    
    init(name: String, count: Int, progress: [String: Int]){
        self.name = name
        self.count = count
        self.progress = progress
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let count = aDecoder.decodeInteger( forKey: "count")
        let name = aDecoder.decodeObject(   forKey: "name") as! String
        let progress = aDecoder.decodeObject(forKey: "progress") as! [String: Int]
        
        self.init(name: name, count: count, progress: progress)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(count, forKey: "count")
        aCoder.encode(name,  forKey: "name")
        aCoder.encode(progress, forKey: "progress")
    }
}
