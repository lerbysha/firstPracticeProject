//
//  CurrentDateViewController.swift
//  SelfCreator
//
//  Created by itisioslab on 13.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class CurrentDateViewController: UIViewController {

    var taskRow: Int!
    var currentTask: Task!
    
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var progressField: UITextField!
    @IBOutlet weak var quantities: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = DataBaseManager()
        datePicker.maximumDate = Date()
        currentTask = data.dearchive(key: "taskArray")[taskRow]
        if (currentTask.isSimple){
            progressField.isHidden = true
            quantities.isHidden = true
        }
        else{
            quantities.text = currentTask.quantities
        }
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        let data = DataBaseManager()
        let date = datePicker.date
        var tempArray = data.dearchive(key: "taskArray")
        tempArray[taskRow].progress[data.getDate(date: date)] = Int(progressField.text!)
        data.archive(array: tempArray, key: "taskArray")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeStatus(_ sender: Any) {
        if (isCompletedSwitch.isOn){
            progressField.text = String(currentTask.count)
            if (!currentTask.isSimple){
                progressField.isEnabled = false
            }
        }
        else{
            progressField.text = nil
            if (currentTask.isSimple){
                progressField.isEnabled = true
            }
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
