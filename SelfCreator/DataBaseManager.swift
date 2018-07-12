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
}
