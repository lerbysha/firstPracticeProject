//
//  DataBaseManager.swift
//  SelfCreator
//
//  Created by itisioslab on 12.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import Foundation

class DataBaseManager

{
    func archive(array: [Any], key: String){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: array)
        UserDefaults.standard.set(encodedData, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func dearchive(key: String) -> [Task]{
        let decoded  = UserDefaults.standard.object(forKey: key) as! Data
        let array = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Task]
        return array
    }
    
    func getDate(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter.string(from: date)
    }
    
    func todayProgressCheck(key: String){
        let tempArray = dearchive(key: key)
        for(task) in tempArray{
            if (task.progress[getDate(date: Date())] == nil){
                task.progress[getDate(date: Date())] = 0
            }
        }
        archive(array: tempArray, key: key)
    }
    
    func reverseDate(date: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ("dd.MM.yy")
        let tempDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = ("yy.MM.dd")
        return dateFormatter.string(from: tempDate!)
    }
}
