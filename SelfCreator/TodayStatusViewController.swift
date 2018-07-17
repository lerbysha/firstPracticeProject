//
//  TodayStatusViewController.swift
//  SelfCreator
//
//  Created by itisioslab on 13.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TodayStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var taskArray:[Task] = []
    let data = DataBaseManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (UserDefaults.standard.object(forKey: "taskArray") != nil){
            data.todayProgressCheck(key: "taskArray")
            taskArray = data.dearchive(key: "taskArray")
            let decoded  = UserDefaults.standard.object(forKey: "taskArray") as! Data
            taskArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Task]
        }
        else{
            let tasks: [Task] = []
            data.archive(array: tasks, key: "taskArray")
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier1", for: indexPath)
        
        let model = taskArray[indexPath.row]
        cell.textLabel?.text = model.name
        if (model.isSimple){
            if (model.progress[data.getDate(date: Date())] == 0){
                cell.detailTextLabel?.text = "Not Completed"
            }
            else{
                cell.detailTextLabel?.text = "Completed"
            }
        }
        else{
            cell.detailTextLabel?.text = String(model.progress[data.getDate(date: Date())]!) + "/" + String(model.count)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = indexPath.row
        performSegue(withIdentifier: "setForCurrentDate", sender: model)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setForCurrentDate"{
            let destinationVC = segue.destination as! CurrentDateViewController
            destinationVC.taskRow = sender as! Int
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
