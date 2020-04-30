//
//  ViewController.swift
//  The Log app
//
//  Created by Ben Yoon on 4/2/20.
//  Copyright © 2020 Benjamin Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //connecting the textfields and pickerview that is used
    @IBOutlet weak var DS: UITextField!
    @IBOutlet weak var DL: UITextField!
    @IBOutlet weak var L: UITextField!
    @IBOutlet weak var S: UIPickerView!
    @IBOutlet weak var W: UITextField!
    @IBOutlet weak var MC: UITextField!
    
    //declaring the variables used and the array used for the picker view
    var species = ""
    var Species: [String] = [String]()
    var D: Double = 0
    var V: Double = 0
    var M: Double = 0
    var MW: Double = 0
    var Mass: Double = 0
    var Final: Int = 0

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //loading the pickerview with the correct components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
    }
    
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Species.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Species[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        species = Species[row]
    }
    
    //on click method to complete the actual calculations
    @IBAction func onClickCalc(_ sender: UIButton) {
        //initializing the diameter variables
        guard let DSDouble = Double(DS.text!) else{
            print("Not a correct value")
            return
        }
        guard let DLDouble = Double(DL.text!) else{
            print("Not a correct value")
            return
        }
        //finding the average diameter
        D = (DSDouble + DLDouble)/2
        //initializing the length
        guard let LDouble = Double(L.text!) else{
            print("Not a correct value")
            return
        }
        //finding the volume
        V = LDouble * 3.141592654 * (D/2)*(D/2)
        print(V)
        //calculating the mass based on the density of the species of wood selected
        if (species == "Oak"){
        M = 673*V
        }
        if (species == "Maple"){
        M = 673*V
        }
        if (species == "Ash"){
        M = 641*V
        }
        //using moisture content to find a new mass
        guard let MCDouble = Double(MC.text!) else{
            print("Not a correct value")
            return
        }
        MW = (M * MCDouble)/100
        Mass = MW + M
        Final = Int(Mass)
        //displaying the final mass
        W.text = String(Final) + " kg"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.S.delegate = self
        self.S.dataSource = self
        //initializing the species array
        Species = ["Oak", "Maple", "Ash"]
        
    }
}

