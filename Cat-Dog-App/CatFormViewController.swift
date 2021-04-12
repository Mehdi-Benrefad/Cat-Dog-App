//
//  CatFormViewController.swift
//  Cat-Dog-App
//
//  Created by Mehdi Benrefad on 10/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate{
    
    var cat = animal()
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var older: UISwitch!
    
    @IBOutlet weak var race: UIPickerView!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var sexe: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        valider.layer.cornerRadius=25.0
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //taille de la liste
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
    
    //retourner l'element correspondant a l'indice passe en parametres
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
    
    
    @IBAction func dismissclavier(_ sender: UITapGestureRecognizer) {
        name.resignFirstResponder()
        phone.resignFirstResponder()
    }
    
    //por le bouton de retour dans le clavier
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        return true
    }
    
    //valider
    @IBAction func recupererdata(_ sender: Any) {
        createDog()
        performSegue(withIdentifier: "segueToSuccessCat", sender: self)
        
    }
    
    func createDog(){
        let namec = name.text!
        let phonec = phone.text!
        let hasMajorityc = older.isOn
        let genderIndex = sexe.selectedSegmentIndex
        
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
        let genderc = ( genderIndex == 0) ? "male" : "female"
        
        
        let raceIndex = race.selectedRow(inComponent: 0)
        let racec = dogRaces[raceIndex]
        
        //creation de l'objet
        cat=animal(String(namec), hasMajorityc, phonec, racec, genderc)
        print(cat.name)
        
    }
    
    //passer les donnees a travers le segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccessCat"{
            //recuperer le controlleur de destination
            let successVC = segue.destination as! CatSuccessViewController
            successVC.cat = cat
            
            //ce segue sera lance dans la methode valider en haut
        }
    }
    }
