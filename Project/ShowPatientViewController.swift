//
//  ShowPatientViewController.swift
//  Project
//
//  Created by Dishant Patel on 2020-04-05.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import UIKit

class ShowPatientViewController: UIViewController {
    
    @IBOutlet weak var nameTextbox: UILabel!
    @IBOutlet weak var priorityTextbox: UILabel!
    @IBOutlet weak var resultsTextbox: UILabel!
    
    var patient:Patient = Patient()
    var waitingNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextbox.text = patient.name
        priorityTextbox.text = String("Priority Level: \(patient.priorityLevel)")
        if patient.priorityLevel == 0 {
            resultsTextbox.text = "No test required!!"
        }
        else {
            resultsTextbox.text = "Your waiting list number: \(waitingNumber)."
        }
    }

}
