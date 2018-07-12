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
    var progress:[Date: Progress]
    
    init(name: String, count: Int){
        self.name = name
        self.count = count
        self.progress = [:]
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let count = aDecoder.decodeInteger(forKey: "count")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        
        self.init(name: name, count: count)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(count, forKey: "count")
        aCoder.encode(name, forKey: "name")
        
    }
}

enum Progress{
    
    
}
