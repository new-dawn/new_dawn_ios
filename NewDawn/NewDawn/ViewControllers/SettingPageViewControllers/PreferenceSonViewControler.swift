//
//  PreferenceSonViewControler.swift
//  NewDawn
//
//  Created by Junlin Liu on 4/17/19.
//  Copyright © 2019 New Dawn. All rights reserved.
//

import Foundation
import UIKit

class AgePrefViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var age_pref: String = UNKNOWN
    let age_choices_from = [Int](18...60)
    let age_choices_to = [Int](18...60)
    var from_age = String(18)
    var to_age = String(60)
    @IBOutlet weak var age_range: UITextField!
    
    override func viewDidLoad() {
        if let age_pref = LocalStorageUtil.localReadKeyValue(key: "age_pref"){
            age_range.text = (age_pref as! String)
        }
        
        age_range.setBottomBorder()
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        
        let ageRangePicker = UIPickerView()
        age_range.inputView = ageRangePicker
        age_range.inputAccessoryView = toolbar
        ageRangePicker.delegate = self
        
        ageRangePicker.selectRow(0, inComponent: 0, animated: true)
        ageRangePicker.selectRow(0, inComponent: 1, animated: true)
        ageRangePicker.selectRow(0, inComponent: 2, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        LocalStorageUtil.localStoreKeyValue(key: "age_pref", value: self.age_range.text!)
        LocalStorageUtil.localStoreKeyValue(key: "from_age", value: self.from_age)
        LocalStorageUtil.localStoreKeyValue(key: "to_age", value: self.to_age)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1{
            return 1
        }else{
            return self.age_choices_from.count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 1{
            return "To"
        }else if component == 0{
            return String(age_choices_from[row])
        }else{
            return String(age_choices_to[row])
        }
    }
    
    @objc func donePicker() {
        age_range.text = self.from_age + " to " + self.to_age + " 岁"
        age_range.resignFirstResponder()
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            let selected_from = pickerView.selectedRow(inComponent: 0)
            self.from_age = String(age_choices_from[selected_from])
        }else if component == 2{
            let selected_to = pickerView.selectedRow(inComponent: 2)
            self.to_age = String(age_choices_to[selected_to])
        }
    }
    
}




class HeightPrefViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var height_pref: String = UNKNOWN
    let height_choices_from = [Int](140...250)
    let height_choices_to = [Int](140...250)
    var from_height = String(140)
    var to_height = String(250)
    @IBOutlet weak var height_range: UITextField!
    
    override func viewDidLoad() {
        if let height_pref = LocalStorageUtil.localReadKeyValue(key: "height_pref"){
            height_range.text = (height_pref as! String)
        }
        height_range.setBottomBorder()
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        
        let heightRangePicker = UIPickerView()
        height_range.inputView = heightRangePicker
        height_range.inputAccessoryView = toolbar
        heightRangePicker.delegate = self
        
        heightRangePicker.selectRow(0, inComponent: 0, animated: true)
        heightRangePicker.selectRow(0, inComponent: 1, animated: true)
        heightRangePicker.selectRow(0, inComponent: 2, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        LocalStorageUtil.localStoreKeyValue(key: "height_pref", value: self.height_range.text!)
        LocalStorageUtil.localStoreKeyValue(key: "from_height", value: self.from_height)
        LocalStorageUtil.localStoreKeyValue(key: "to_height", value: self.to_height)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1{
            return 1
        }else{
            return self.height_choices_from.count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 1{
            return "To"
        }else if component == 0{
            return String(height_choices_from[row])
        }else{
            return String(height_choices_to[row])
        }
    }
    
    @objc func donePicker() {
        height_range.text = self.from_height + " to " + self.to_height + " cm"
        height_range.resignFirstResponder()
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            let selected_from = pickerView.selectedRow(inComponent: 0)
            self.from_height = String(height_choices_from[selected_from])
        }else if component == 2{
            let selected_to = pickerView.selectedRow(inComponent: 2)
            self.to_height = String(height_choices_to[selected_to])
        }
    }
    
}
