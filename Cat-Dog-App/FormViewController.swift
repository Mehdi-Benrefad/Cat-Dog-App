//
//  FormViewController.swift
//  Cat-Dog-App
//
//  Created by Mehdi Benrefad on 10/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class FormViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameinput: UITextField!

    @IBOutlet weak var phoneNumberInput: UITextField!
    
    @IBOutlet weak var valider: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        valider.layer.cornerRadius=25.0    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }

    
    @IBAction func dismissclavier(_ sender: UITapGestureRecognizer) {
        
        nameinput.resignFirstResponder()
        phoneNumberInput.resignFirstResponder()
    }
    
}
