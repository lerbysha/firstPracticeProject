//
//  TaskInfoVC.swift
//  SelfCreator
//
//  Created by itisioslab on 12.07.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TaskInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var task: Task!
    var progressDates :[String]!
    let data = DataBaseManager()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var TaskCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskName.text = task.name
        if(task.isSimple){
            TaskCount.text = "Simple Task"
        }
        else{
            TaskCount.text = String(task.count)
        }
        progressDates = [String](task.progress.keys)
        progressDates.sort{$0 > $1}
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.progress.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoForDate", for: indexPath)
        cell.textLabel?.text = data.reverseDate(date: progressDates[indexPath.row])
        if (task.isSimple){
            if (task.progress[progressDates[indexPath.row]] == 0){
                cell.detailTextLabel?.text = "Not Completed"
            }
            else{
                cell.detailTextLabel?.text = "Completed"
            }
        }
        else{
            cell.detailTextLabel?.text = String(task.progress[progressDates[indexPath.row]]!) + "/" + String(task.count)
        }
        return cell
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
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
