//
//  TaskAddViewController.swift
//  SelfCreator
//
//  Created by itisioslab on 12.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TaskAddViewController: UIViewController {
    
    
    @IBOutlet weak var TaskName: UITextField!
    @IBOutlet weak var TaskCount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func SaveTask(_ sender: Any) {
        let tempTask = Task.init(name: TaskName.text!, count: Int(TaskCount.text!)!)
        let decoded  = UserDefaults.standard.object(forKey: "taskArray") as! Data
        var tempArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Task]
        tempArray.append(Task.init(name: tempTask.name, count: tempTask.count))
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: tempArray)
        UserDefaults.standard.set(encodedData, forKey: "taskArray")
        UserDefaults.standard.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
