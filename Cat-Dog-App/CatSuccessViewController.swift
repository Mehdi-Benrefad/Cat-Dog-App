//
//  CatSuccessViewController.swift
//  Cat-Dog-App
//
//  Created by Mehdi Benrefad on 10/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {
   var cat=animal()
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var home: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        back.layer.cornerRadius=25.0
        home.layer.cornerRadius=25.0
    }
    

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
