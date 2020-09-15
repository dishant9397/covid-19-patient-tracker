//
//  ViewController.swift
//  Project
//
//  Created by Dishant Patel on 2020-04-05.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var patientList:[Patient] = [Patient]()
    var pendingPatients:[Patient] = [Patient]()
    var exemptedPatients:[Patient] = [Patient]()
    var isPendingCase:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 70
        if self.title == "Pending Cases" {
            isPendingCase = true
            pendingPatients.sort{$0.priorityLevel > $1.priorityLevel}
        }
        else {
            exemptedPatients.sort{$0.name < $1.name}
        }
        patientList.sort{$0.priorityLevel > $1.priorityLevel}
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.title == "Pending Cases" {
            isPendingCase = true
            pendingPatients.sort{$0.priorityLevel > $1.priorityLevel}
        }
        else {
            exemptedPatients.sort{$0.name < $1.name}
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isPendingCase {
            return pendingPatients.count
        }
        else {
            return exemptedPatients.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "patientsCell") as? PatientsTableViewCell
        if cell == nil {
            cell = PatientsTableViewCell (style: .default, reuseIdentifier: "patientsCell")
        }

        if isPendingCase {
            cell?.nameLabel.text = "Name: \(pendingPatients[indexPath.row].name)"
            cell?.ageLabel.text = "Age: \(String(pendingPatients[indexPath.row].age))"
            if pendingPatients[indexPath.row].priorityLevel == 3 {
                cell?.nameLabel.textColor = UIColor.red
                cell?.ageLabel.textColor = UIColor.red
                cell?.priorityLevelLabel.textColor = UIColor.red
            }
            else if pendingPatients[indexPath.row].priorityLevel == 2 {
                cell?.nameLabel.textColor = UIColor.orange
                cell?.ageLabel.textColor = UIColor.orange
                cell?.priorityLevelLabel.textColor = UIColor.orange
            }
            else if pendingPatients[indexPath.row].priorityLevel == 1 {
                cell?.nameLabel.textColor = UIColor.green
                cell?.ageLabel.textColor = UIColor.green
                cell?.priorityLevelLabel.textColor = UIColor.green
            }
            cell?.priorityLevelLabel.text = "Priority: \(String(pendingPatients[indexPath.row].priorityLevel))"
        }
        else {
            cell?.nameLabel.text = "Name: \(exemptedPatients[indexPath.row].name)"
            cell?.ageLabel.text = "Age: \(String(exemptedPatients[indexPath.row].age))"
            if exemptedPatients[indexPath.row].hasTravelled {
                cell?.priorityLevelLabel.text = "Recently Travelled: Yes"
            }
            else {
                cell?.priorityLevelLabel.text = "Recently Travelled: No"
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        if isPendingCase {
            let alertBox = UIAlertController(
                title: "Confirm Test Result",
                message: "Is this Patient's Test completed?",
                preferredStyle: .alert
            )
            alertBox.addAction(
                UIAlertAction(title:"Yes", style: .default, handler:{
                    action in
                    self.patientList.remove(at: selectedRow)
                    self.pendingPatients.remove(at: selectedRow)
                    (self.tabBarController?.viewControllers?[0] as! AddPatientViewController).patientList = self.patientList
                    tableView.reloadData()
                })
            )
            alertBox.addAction(UIAlertAction(title:"No", style: .default, handler:nil))
            self.present(alertBox, animated:true)
        }
        else {
        }
    }
}

