//
//  SecondViewController.swift
//  PackIt
//
//  Created by student on 10/24/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var sunny: UIImageView!
    
    @IBOutlet weak var rainy: UIImageView!
    
    @IBOutlet weak var cold: UIImageView!
    
    @IBOutlet weak var airplane: UIImageView!
    
    @IBOutlet weak var car: UIImageView!
    
    @IBOutlet weak var bus: UIImageView!
    
    var weather : String = ""
    var modeOfTransport : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // add the colors to all the buttons on the screen
        
        self.title = "More Info"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
        rainy.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        sunny.tintColor =  #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        cold.tintColor =  #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        airplane.tintColor =  #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        car.tintColor =  #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        bus.tintColor =  #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        
    }
    

    // this function gets executed when the selected weather is rainy
    
    @IBAction func rainyClicked(_ sender: Any) {
        
        if rainy.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            rainy.backgroundColor = .none
            rainy.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            weather = ""
        }else{
            rainy.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            rainy.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            sunny.backgroundColor = .none
            sunny.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            cold.backgroundColor = .none
            cold.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            weather = "rainy"
            validateValues()
        }
    }
    // this function gets executed when the selected weather is sunny
    @IBAction func sunnyClicked(_ sender: Any) {
        if sunny.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            sunny.backgroundColor = .none
            sunny.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            weather = ""
        }else{
            sunny.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            sunny.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            rainy.backgroundColor = .none
            rainy.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            cold.backgroundColor = .none
            cold.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            weather = "sunny"
            validateValues()
        }
    }
    
    // this function gets executed when the selected weather is cold
    
    @IBAction func coldClicked(_ sender: Any) {
        if cold.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            cold.backgroundColor = .none
            cold.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            weather = ""
        }else{
            cold.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            cold.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            rainy.backgroundColor = .none
            rainy.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            sunny.backgroundColor = .none
            sunny.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            weather = "cold"
            validateValues()
        }
    }
    
    // this function gets executed when the selected mode of transportation is Car
    
    @IBAction func carClicked(_ sender: Any) {
        if car.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            car.backgroundColor = .none
            car.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            modeOfTransport = ""
        }else{
            car.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            car.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            bus.backgroundColor = .none
            bus.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            airplane.backgroundColor = .none
            airplane.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            modeOfTransport = "car"
            validateValues()
        }
    }
    // this function gets executed when the selected mode of transportation is Airplane
    @IBAction func airplaneClicked(_ sender: Any) {
        if airplane.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            airplane.backgroundColor = .none
            airplane.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            modeOfTransport = ""
        }else{
            airplane.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            airplane.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            bus.backgroundColor = .none
            bus.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            car.backgroundColor = .none
            car.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            modeOfTransport = "airplane"
            validateValues()
        }
    }
    
    // this function gets executed when the selected mode of transportation is Bus
    @IBAction func busClicked(_ sender: Any) {
        if bus.tintColor == #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1) {
            bus.backgroundColor = .none
            bus.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            modeOfTransport = ""
        }else{
            bus.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            bus.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            airplane.backgroundColor = .none
            airplane.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            car.backgroundColor = .none
            car.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            modeOfTransport = "bus"
            validateValues()
        }
    }
    
    @objc func rightHandAction(_ sender: Any) {
       
       cancelAlert()
    }
    
    func validateValues() {
        if !weather.isEmpty{
            if !modeOfTransport.isEmpty {
                ViewController.usefulValues.dict["weather"] = weather
                ViewController.usefulValues.dict["transport"] = modeOfTransport
                performSegue(withIdentifier: "secondToActivities", sender: self)
            }
        }
    }
    
    // called when cancel is clicked
    func createAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func cancelAlert() {
        let cancelAlertVar = UIAlertController(title: "Warning", message: "Are you sure you want to cancel creating the list?", preferredStyle: UIAlertController.Style.alert)

        cancelAlertVar.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "cancelFromweatherTrans", sender: self)
        }))

        cancelAlertVar.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(cancelAlertVar, animated: true, completion: nil)
    }

}
