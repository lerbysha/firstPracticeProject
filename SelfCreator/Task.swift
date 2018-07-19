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
    var quantities:String
    var progress:[String: Int]
    var isSimple: Bool
    
    init(name: String, count: Int, isSimple: Bool, quantities: String){
        self.name = name
        self.count = count
        self.quantities = quantities
        self.progress = [:]
        let data = DataBaseManager()
        let date = data.getDate(date: Date())
        self.progress[date] = 0
        self.isSimple = isSimple
    }
    
    init(name: String, count: Int, progress: [String: Int], isSimple: Bool,quantities: String){
        self.name = name
        self.count = count
        self.quantities = quantities
        self.progress = progress
        self.isSimple = isSimple
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let count = aDecoder.decodeInteger( forKey: "count")
        let quantities = aDecoder.decodeObject(forKey: "quantities") as! String
        let name = aDecoder.decodeObject(   forKey: "name") as! String
        let progress = aDecoder.decodeObject(forKey: "progress") as! [String: Int]
        let isSimple = aDecoder.decodeBool(forKey: "isSimple")
        self.init(name: name, count: count, progress: progress, isSimple: isSimple, quantities: quantities)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(count, forKey: "count")
        aCoder.encode(quantities, forKey: "quantities")
        aCoder.encode(name,  forKey: "name")
        aCoder.encode(progress, forKey: "progress")
        aCoder.encode(isSimple, forKey: "isSimple")
    }
}
