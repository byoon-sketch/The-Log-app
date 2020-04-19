//
//  ViewController.swift
//  The Log app
//
//  Created by Ben Yoon on 4/2/20.
//  Copyright © 2020 Benjamin Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var DS: UITextField!
    @IBOutlet weak var DL: UITextField!
    @IBOutlet weak var L: UITextField!
    @IBOutlet weak var S: UIPickerView!
    @IBOutlet weak var W: UITextField!
    @IBOutlet weak var MC: UITextField!
    
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
    
    @IBAction func onClickCalc(_ sender: UIButton) {
        guard let DSDouble = Double(DS.text!) else{
            print("Not a correct value")
            return
        }
        guard let DLDouble = Double(DL.text!) else{
            print("Not a correct value")
            return
        }
        D = (DSDouble + DLDouble)/2
        guard let LDouble = Double(L.text!) else{
            print("Not a correct value")
            return
        }
        V = LDouble * 3.141592654 * sqrt((D/2))
        print(V)
        if (species == "Oak"){
        M = 673*V
        }
        if (species == "Maple"){
        M = 673*V
        }
        if (species == "Ash"){
        M = 641*V
        }
        guard let MCDouble = Double(MC.text!) else{
            print("Not a correct value")
            return
        }
        MW = (M * MCDouble)/100
        Mass = MW + M
        Final = Int(Mass)
        W.text = String(Final) + " kg"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.S.delegate = self
        self.S.dataSource = self
        
        Species = ["Oak", "Maple", "Ash"]
        
    }
}

