//
//  AddPatientViewController.swift
//  Project
//
//  Created by Dishant Patel on 2020-04-05.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import UIKit

class AddPatientViewController: UIViewController {

    // The Simulator used is iPhone 11 Pro Max
    @IBOutlet weak var nameTextbox: UITextField!
    @IBOutlet weak var birthDatePickerView: UIDatePicker!
    @IBOutlet weak var recentlyTravelledToggle: UISwitch!
    
    var patientList:[Patient] = [Patient]()
    var patient:Patient = Patient()
    var name:String = ""
    var age:Int = 0
    var hasTravelled:Bool = false
    var priorityLevel:Int = 0
    var waitingNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patientList.append(Patient(name: "Peter", age: 70, hasTravelled: true, priorityLevel: 3))
        patientList.append(Patient(name: "Mary", age: 25, hasTravelled: true, priorityLevel: 1))
        patientList.append(Patient(name: "Emily", age: 65, hasTravelled: false, priorityLevel: 0))
        patientList.append(Patient(name: "Dishant", age: 66, hasTravelled: false, priorityLevel: 0))
        patientList.append(Patient(name: "Kate", age: 81, hasTravelled: false, priorityLevel: 2))
        ((self.tabBarController?.viewControllers?[1] as! ViewController).pendingPatients, (self.tabBarController?.viewControllers?[2] as! ViewController).exemptedPatients) = categorizePatients(patientList: patientList)
        (self.tabBarController?.viewControllers?[1] as! ViewController).patientList = patientList
        birthDatePickerView.maximumDate = Date()
    }

    @IBAction func addPatientButtonPressed(_ sender: Any) {
        let button = (sender as AnyObject).tag
        if button == 0 {
            name = nameTextbox.text!
            if name == "" {
                let alertBox = UIAlertController(
                    title: "Incomplete Details",
                    message: "Please enter the name to go ahead",
                    preferredStyle: .alert
                )
                alertBox.addAction(UIAlertAction(title:"OK", style: .cancel, handler:nil))
                self.present(alertBox, animated:true)
            }
            else {
                age = Calendar.current.dateComponents([.year,.month,.day], from: birthDatePickerView.date, to: Date()).year!
                if recentlyTravelledToggle.isOn {
                    hasTravelled = true
                }
                else {
                    hasTravelled = false
                }
                priorityLevel = calculatePriority(age: age, hasTravelled: hasTravelled)
                patient = Patient(name: name, age: age, hasTravelled: hasTravelled, priorityLevel: priorityLevel)
                patientList.append(patient)
                ((self.tabBarController?.viewControllers?[1] as! ViewController).pendingPatients, (self.tabBarController?.viewControllers?[2] as! ViewController).exemptedPatients) = categorizePatients(patientList: patientList)
                (self.tabBarController?.viewControllers?[1] as! ViewController).patientList = patientList
                waitingNumber = calculateWaitingNumber(priorityLevel: priorityLevel)
            }
        }
        else if button == 1 {
            nameTextbox.text?.removeAll()
            birthDatePickerView.setDate(Date(), animated: true)
            recentlyTravelledToggle.setOn(false, animated: true)
        }
        
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showPatientScreen = segue.destination as! ShowPatientViewController
        showPatientScreen.patient = self.patient
        showPatientScreen.waitingNumber = self.waitingNumber
    }
    
    func calculatePriority(age:Int, hasTravelled:Bool) -> Int {
        var priorityLevel:Int = 0
        if age > 65 && hasTravelled == true {
            priorityLevel = 3
        }
        else if age <= 65 && hasTravelled == false {
            priorityLevel = 0
        }
        else if age > 65 {
            priorityLevel = 2
        }
        else if hasTravelled == true {
            priorityLevel = 1
        }
        return priorityLevel
    }
    
    func categorizePatients(patientList:[Patient]) -> ([Patient], [Patient]) {
        var pendingPatients:[Patient] = [Patient]()
        var exemptedPatients:[Patient] = [Patient]()
        for patient in patientList {
            if patient.priorityLevel == 0 {
                exemptedPatients.append(patient)
            }
            else {
                pendingPatients.append(patient)
            }
        }
        return (pendingPatients, exemptedPatients)
    }
    
    func calculateWaitingNumber(priorityLevel:Int) -> Int {
        var waitingNumber:Int = 0
        patientList.sort{$0.priorityLevel > $1.priorityLevel}
        for (index,patient) in patientList.enumerated() {
            if priorityLevel > patient.priorityLevel {
                waitingNumber = index
                break
            }
        }
        return waitingNumber
    }
    
}
