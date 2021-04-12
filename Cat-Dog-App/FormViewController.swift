//
//  FormViewController.swift
//  Cat-Dog-App
//
//  Created by Mehdi Benrefad on 10/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class FormViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate {
    
    var dog = animal()
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
        //validation ou refus du segue
        checkDogStatus()
        
    }
    
    
    //fonction qui decide si on affiche le segue ou une alerte d'erreur
    private func checkDogStatus() {
        switch dog.hasMajority {
        case true:
            performSegue(withIdentifier: "segueToSuccess", sender: self)
        case false:
            presentAlert(with: "Votre age doit etre superieur a 4 ans")
        }
    }

    //fonction qui prepare l'alerte a afficher
    private func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
        
        //creation de l'objet
        dog=animal(String(name), hasMajority, phone, race, gender)
        print(dog.name)
        
    }
    
    //passer les donnees a travers le segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess"{
            //recuperer le controlleur de destination
            let successVC = segue.destination as! SuccessViewController
            successVC.dog = dog
            
            //ce segue sera lance dans la methode valider en haut
        }
    }
    
}
