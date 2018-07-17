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
    @IBOutlet weak var TaskType: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskType.isOn = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func SaveTask(_ sender: Any) {
        let tempTask = Task.init(name: TaskName.text!, count: Int(TaskCount.text!)!, isSimple: TaskType.isOn)
        let data = DataBaseManager()
        var tempArray = data.dearchive(key: "taskArray")
        tempArray.append(tempTask)
        data.archive(array: tempArray, key: "taskArray")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeTaskType(_ sender: Any) {
        if (TaskType.isOn){
            TaskCount.text = String(1)
            TaskCount.isHidden = true
        }
        else{
            TaskCount.text = nil
            TaskCount.isHidden = false
        }
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
