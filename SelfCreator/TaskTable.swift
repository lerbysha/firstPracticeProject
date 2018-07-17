//
//  TaskTable.swift
//  SelfCreator
//
//  Created by itisioslab on 12.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TaskTable: UITableViewController {
    
    var taskArray:[Task] = []
    let data = DataBaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (UserDefaults.standard.object(forKey: "taskArray") != nil){
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


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let model = taskArray[indexPath.row]
        cell.textLabel?.text = model.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = taskArray[indexPath.row]
        performSegue(withIdentifier: "auth", sender: model)
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "auth"{
            let destinationVC = segue.destination as! TaskInfoVC
            destinationVC.task = sender as! Task
        }
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            taskArray.remove(at: indexPath.row)
            data.archive(array: taskArray, key: "taskArray")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
