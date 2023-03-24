//
//  ActivitiesViewController.swift
//  PackIt
//
//  Created by student on 10/25/22.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var swim: UIImageView!
    
    @IBOutlet weak var golf: UIImageView!
    
    @IBOutlet weak var dance: UIImageView!
    
    @IBOutlet weak var music: UIImageView!
    
    @IBOutlet weak var biking: UIButton!
    
    
    @IBOutlet weak var skiing: UIImageView!
    
    
    
    var activitiesArr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Activities"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        biking.contentVerticalAlignment = .fill
        biking.contentHorizontalAlignment = .fill
        
        swim.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        golf.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        dance.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        music.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        biking.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        skiing.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))

    }
    // this function is called when the selected activity is Swimming
    
    @IBAction func swimClicked(_ sender: Any) {
        
        if swim.backgroundColor == #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1) {
            swim.backgroundColor = .none
            swim.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            if let index = activitiesArr.firstIndex(of: "swim") {
                activitiesArr.remove(at: index)
            }
        } else{
            swim.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            swim.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            activitiesArr.append("swim")
        }
    }
    
    // this function is called when the selected activity is Golfing
    
    @IBAction func golfClicked(_ sender: Any) {
        if golf.backgroundColor == #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1) {
            golf.backgroundColor = .none
            golf.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            if let index = activitiesArr.firstIndex(of: "golf") {
                activitiesArr.remove(at: index)
            }
        } else{
            golf.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            golf.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            activitiesArr.append("golf")
        }
    }
    
    // this function is called when the selected activity is Dancing
    @IBAction func danceClicked(_ sender: Any) {
        if dance.backgroundColor == #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1) {
            dance.backgroundColor = .none
            dance.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            if let index = activitiesArr.firstIndex(of: "dance") {
                activitiesArr.remove(at: index)
            }
        } else{
            dance.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            dance.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            activitiesArr.append("dance")
        }
    }
    
    // this function is called when the selected activity is Music
    @IBAction func musicClicked(_ sender: Any) {
        if music.backgroundColor == #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1) {
            music.backgroundColor = .none
            music.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            if let index = activitiesArr.firstIndex(of: "music") {
                activitiesArr.remove(at: index)
            }
        } else{
            music.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            music.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            activitiesArr.append("music")
        }
    }
    
    // this function is called when the selected activity is Biking
    @IBAction func bikingClicked(_ sender: Any) {
        print("biking is clicked")
        if biking.backgroundColor == #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1) {
            biking.backgroundColor = .none
            biking.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            if let index = activitiesArr.firstIndex(of: "biking") {
                activitiesArr.remove(at: index)
            }
        } else{
            biking.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            biking.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            activitiesArr.append("biking")
        }
    }
    
    // this function is called when the selected activity is Skiing
    @IBAction func skiingClicked(_ sender: Any) {
        if skiing.backgroundColor == #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1) {
            skiing.backgroundColor = .none
            skiing.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            if let index = activitiesArr.firstIndex(of: "skiing") {
                activitiesArr.remove(at: index)
            }
        } else{
            skiing.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            skiing.tintColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            activitiesArr.append("skiing")
        }
    }
    
    @IBAction func createListAction(_ sender: Any) {
        ViewController.usefulValues.dict["activities"] = activitiesArr.joined(separator: "-")
        ViewController.usefulValues.essentials.removeAll()
        ViewController.usefulValues.documents.removeAll()
        ViewController.usefulValues.clothing.removeAll()
        ViewController.usefulValues.gadgets.removeAll()
        ViewController.usefulValues.misc.removeAll()
        performSegue(withIdentifier: "createListToTableView", sender: self)
        
    }
    
    @objc func rightHandAction(_ sender: Any) {
        cancelAlert()
        
    }
    
    //called when cancel is clicked from the screen
    
    func cancelAlert() {
        let cancelAlertVar = UIAlertController(title: "Warning", message: "Are you sure you want to cancel creating the list?", preferredStyle: UIAlertController.Style.alert)

        cancelAlertVar.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "cancelFromActivities", sender: self)
        }))

        cancelAlertVar.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(cancelAlertVar, animated: true, completion: nil)
    }
    

}
