//
//  FormViewController.swift
//  Cat-Dog-App
//
//  Created by Mehdi Benrefad on 10/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class FormViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate {
    
    @IBOutlet weak var nameinput: UITextField!

    @IBOutlet weak var phoneNumberInput: UITextField!
    
    
    @IBOutlet weak var sexeInput: UISegmentedControl!
    @IBOutlet weak var valider: UIButton!
    

    @IBOutlet weak var fourYersOld: UISwitch!
    
    @IBOutlet weak var raceduchien: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        valider.layer.cornerRadius=25.0    }
    
    //nombre de listes a retourner
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //taille de la liste
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    //retourner l'element correspondant a l'indice passe en parametres
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }

    //quiter le clavier en cliquant ailleurs
    @IBAction func dismissclavier(_ sender: UITapGestureRecognizer) {
        
        nameinput.resignFirstResponder()
        phoneNumberInput.resignFirstResponder()
    }
    
    
    //por le bouton de retour dans le clavier
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameinput.resignFirstResponder()
        return true
    }
    
    
    @IBAction func Valider() {
        createDog()
    }
    
    func createDog(){
        let name = nameinput.text!
        let phone = phoneNumberInput.text!
        let hasMajority = fourYersOld.isOn
        let genderIndex = sexeInput.selectedSegmentIndex
        
        //methode1
        /*
        var gender = String()
        if genderIndex == 0 {
            gender = "male"
        } else {
            gender = "female"
        }
         */
        //methode2
        let gender = ( genderIndex == 0) ? "male" : "female"
        
        
        let raceIndex = raceduchien.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        
        //creation de l'onjet
        var dog=animal(String(name), hasMajority, phone, race, gender)
        
    }
    
        
    
}
