//
//  ViewController.swift
//  PackIt
//
//  Created by student on 10/21/22.
//

import UIKit
import SwiftUI

//struct UsefulValues : Codable{
//     static var dict = [String : String]()
//    static var essentials = [String]()
//    static var documents = [String]()
//    static var clothing = [String]()
//    static var gadgets = [String]()
//    static var misc = [String]()
//}

class ViewController : UIViewController{
    
    @IBOutlet weak var listName: UITextField!
    
    @IBOutlet weak var vacationStartDate: UIDatePicker!
    
    @IBOutlet weak var vacationEndDate: UIDatePicker!
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var femaleImage: UIImageView!
    public static let usefulValues = UsefulValues()
    public static var itenaryLists = [String : Array<Array<String>>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maleButton.contentVerticalAlignment = .fill
        maleButton.contentHorizontalAlignment = .fill
        
        listName.backgroundColor = UIColor.clear
        let border = CALayer()
        border.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            border.frame = CGRect(x: 0, y: listName.frame.height - 1, width: listName.frame.width, height: 1)
            listName.layer.addSublayer(border)
            self.view.layer.masksToBounds = true
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        // Do any additional setup after loading the view.
        listName.attributedPlaceholder = NSAttributedString(
            string: "eg: Paris",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)]
        )
        
        vacationStartDate.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        vacationEndDate.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
    //when the view appears from clicking back from the next screens, clear the selected buttons
    
    override func viewDidAppear(_ animated: Bool) {
        listName.text = ""
        ViewController.usefulValues.dict["gender"] = ""
        vacationStartDate.date = Date()
        vacationEndDate.date = Date()
        maleButton.backgroundColor = .none
        femaleImage.backgroundColor = .none
        
    }
    
    @IBAction func listNameUpdated(_ sender: Any) {
        checkAllFieldsFilled()
    }
    
    // function to validate the start date and end date fields
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        // picker.setValue(UIColor.white, forKeyPath: "vacationStartDate")
        presentedViewController?.dismiss(animated: true, completion: nil)
        let date = Date()
        var order = Calendar.current.compare(vacationStartDate.date, to: vacationEndDate.date, toGranularity: .day)
        var order2 = Calendar.current.compare(Date(), to: vacationStartDate.date, toGranularity: .day)
        if order.rawValue == 1 {
            createAlert(title: "Invalid Input", msg: "Start Date can't be greater than End Date")
            vacationStartDate.date = date
            vacationEndDate.date = date
        }else if order2.rawValue == 1 {
            createAlert(title: "Invalid Input", msg: "Start Date can't be lesser than Current Date")
            vacationStartDate.date = date
        }
    }
   
    // function to create alerts for invalid inputs
    
    func createAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // this function gets executed when the male gender is clicked on the UI
    
    @IBAction func maleButtonClicked(_ sender: Any) {
        
        if maleButton.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            maleButton.backgroundColor = .none
            maleButton.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            ViewController.usefulValues.dict["gender"] = ""
        }else{
            ViewController.usefulValues.dict["gender"] = "m"
            maleButton.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            femaleImage.backgroundColor = .none
            maleButton.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            checkAllFieldsFilled()

        }
    }
    // this function gets executed when the female gender is clicked on the UI
    
    @IBAction func femaleClicked(_ sender: Any) {
        if femaleImage.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            femaleImage.backgroundColor = .none
            femaleImage.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            ViewController.usefulValues.dict["gender"] = ""
        }else{
            ViewController.usefulValues.dict["gender"] = "f"
            femaleImage.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            maleButton.backgroundColor = .none
            femaleImage.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            checkAllFieldsFilled()
            
                print("calling checkallfields from gender")
        }
    }
    
    // when cancel is clicked, cancel alert is popped up
    
    @objc func rightHandAction(_ sender: Any) {
       
        cancelAlert()
    }
    
    // validate all the input fields before going to the next screen
    
    func checkAllFieldsFilled() {
        var listNames = ViewController.usefulValues.dict["listName"]
        if listName.text?.count != 0 {
            if listNames != nil &&  ((listNames?.contains(listName.text!)) != false){
                
                createAlert(title: "Invalid Input", msg: "List Name already exists!")
            } else {
                if ViewController.usefulValues.dict["gender"] == "" {
                    
                } else {
                    ViewController.usefulValues.dict["listName"] = listName.text
                    
                    ViewController.usefulValues.dict["daysOfTravel"] = String(round((vacationEndDate.date.timeIntervalSinceReferenceDate - vacationStartDate.date.timeIntervalSinceReferenceDate)/86400))
                    // print(UsefulValues.dict["daysOfTravel"] as Any)
                    performSegue(withIdentifier: "firstToSecond", sender: self)
                }
            }
        }
    }
    
    // when cancel is clicked, redict the screen to the home screen
    
    func cancelAlert() {
        let cancelAlertVar = UIAlertController(title: "Warning", message: "Are you sure you want to cancel creating the list?", preferredStyle: UIAlertController.Style.alert)

        cancelAlertVar.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "cancelFromHome", sender: self)
        }))

        cancelAlertVar.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(cancelAlertVar, animated: true, completion: nil)
    }
    
}

