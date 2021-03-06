//
//  Profile_Height.swift
//  NewDawn
//
//  Created by macboy on 12/23/18.
//  Copyright © 2018 New Dawn. All rights reserved.
//

import UIKit

let HEIGHT = "height"

class Profile_Height: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    /* Constant String Keys*/
    let VISIBLE = "height_visible"
    
    /* Constrains */
    
    // var visibleField = false
    

    let heightPickerData = Profile_Height.heightGenerator(minHeight: 140, maxHeight: 250)
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backButton: UIButton!

    // @IBOutlet weak var visibleButton: UIButton!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // polishUIButton(button: visibleButton)


        loadStoredFields()
        heightTextField.setBottomBorder()
        
        //move text 20 pixels up

        continueButton.titleEdgeInsets = UIEdgeInsets(top: -20.0, left: 0.0, bottom: 0.0, right: 0.0)
        backButton.titleEdgeInsets = UIEdgeInsets(top: -20.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        // Picker Toolbar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Profile_Height.donePicker))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        // Degree Picker
        let heightPicker = UIPickerView()
        heightTextField.inputView = heightPicker
        heightTextField.inputAccessoryView = toolbar
        heightPicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool{
        if (heightTextField.text?.isEmpty)! && identifier == "height_continue" {
            self.displayMessage(userMessage: "Cannot have empty field")
            return false
        }else{
            return true
        }
    }
    
    func loadStoredFields() {
        if let height = localReadKeyValue(key: HEIGHT) as? String {
            heightTextField.text = height
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "height_continue", sender: self){
            performSegue(withIdentifier: "height_continue", sender: self)
            localStoreKeyValue(key: HEIGHT, value: heightTextField.text!)
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heightPickerData.count
    }

    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heightPickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        heightTextField.text = heightPickerData[row]
    }
    
    @objc func donePicker() {
        heightTextField.resignFirstResponder()
    }
    
    class func heightGenerator(minHeight: Int, maxHeight: Int) -> [String]{
        let heights_int = [Int](minHeight...maxHeight)
        var heightStringArray = heights_int.map { String($0) + " cm"}
        let min_value = "<" + String(minHeight) + " cm"
        let max_value = ">" + String(maxHeight) + " cm"
        heightStringArray.insert(min_value, at: 0)
        heightStringArray.insert(max_value, at: heightStringArray.count)
        return heightStringArray
    }
}
