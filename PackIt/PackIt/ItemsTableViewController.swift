//
//  ItemsTableViewController.swift
//  PackIt
//
//  Created by student on 10/25/22.
//

/*
 This class generates the items based on the inputs given by the user so far.
 Based on the selected weather condition or the activity type, the required items are displayed in their
    respective categories
 More values can be added to these lists in the future according to the requirement
 Toggle switch is present for each list item which can be selected or deselected.
 Once an item is selected ,and the user goes back to the categories page and returns to the items page,
    the previously selected items are preserved and are displayed as selected.
 */
import UIKit

class ItemsTableViewController: UITableViewController {
    
    var selectedCategory : String?
    var essentials = [String]()
    var documents = [String]()
    var clothing = [String]()
    var gadgets = [String]()
    var misc = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.rightBarButtonItem = self.editButtonItem;
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
        if selectedCategory == "Essentials" {
            essentials.append("Phone")
            essentials.append("Airpods")
            essentials.append("Wallet")
            
            if ((ViewController.usefulValues.dict["activities"]?.contains("swim")) == true) {
                essentials.append("Swim Cap")
                essentials.append("Swim Goggles")
                essentials.append("Towels")
            }
            if ((ViewController.usefulValues.dict["activities"]?.contains("music")) == true) {
                essentials.append("Musical Instruments")
                essentials.append("Cables for the instruments")
                essentials.append("Music Sheets")
            }
            if ((ViewController.usefulValues.dict["activities"]?.contains("golf")) == true) {
                essentials.append("Golf Clubs")
                essentials.append("Polo shirts")
                essentials.append("Tooth brush")
            }
            if ((ViewController.usefulValues.dict["activities"]?.contains("biking")) == true) {
                essentials.append("Biking Shorts")
                essentials.append("Water Bottles")
            }
            if (ViewController.usefulValues.dict["weather"] == "rainy") {
                essentials.append("Umbrella")
            }
        } else if selectedCategory == "Clothing" {
            clothing.append("Trousers")
            clothing.append("T shirts")
            clothing.append("Sweat pants")
            
            if (ViewController.usefulValues.dict["gender"] == "f") {
                clothing.append("Dresses")
                clothing.append("Makeup")
                
            }else if (ViewController.usefulValues.dict["gender"] == "m") {
                clothing.append("Belt")
                clothing.append("Jacket")
                clothing.append("Coat")
            }
            if ((ViewController.usefulValues.dict["activities"]?.contains("swim")) == true) {
                clothing.append("Swim Suit")
                clothing.append("Towels")
            }
            if ((ViewController.usefulValues.dict["activities"]?.contains("golf")) == true) {
                clothing.append("Polo shirts")
                clothing.append("Trousers")
            }
            if (ViewController.usefulValues.dict["weather"] == "cold") {
                clothing.append("Sweaters")
                clothing.append("Gloves")
                clothing.append("Scarf")
            }else if (ViewController.usefulValues.dict["weather"] == "rainy") {
                clothing.append("Rain Jacket")
                clothing.append("Rain Boots")
            }
            if (ViewController.usefulValues.dict["transport"] == "airplane") {
                clothing.append("Extra pair of clothes in cabin bag")
            }else if (ViewController.usefulValues.dict["transport"] == "bus") {
                clothing.append("Travel pants")
            }
        }else if selectedCategory == "Documents" {
            documents.append("Passport")
            documents.append("Photographs")
            documents.append("Vaccination Certificates")
            documents.append("Office files")
            if (ViewController.usefulValues.dict["transport"] == "airplane") {
                documents.append("Flight Ticket")
            }else if (ViewController.usefulValues.dict["transport"] == "bus") {
                clothing.append("Bus Ticket")
            }
        }else if selectedCategory == "Gadgets" {
            gadgets.append("Secondary Phone")
            gadgets.append("Phone Charger")
            gadgets.append("Laptop")
            gadgets.append("Laptop Charger")
            gadgets.append("Ipad")
            gadgets.append("Watch")
        }else if selectedCategory == "Miscellaneous" {
            misc.append("Turn off the gas")
            misc.append("Turn off the lights")
            misc.append("Turn off the water")
            misc.append("Lock the door")
            misc.append("Download/carry offline maps")
            if (ViewController.usefulValues.dict["transport"] == "car") {
                clothing.append("Check the gas in the car")
            }
        }
        
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (selectedCategory == "Essentials") {
            return essentials.count
        }else if (selectedCategory == "Documents") {
            return documents.count
        }else if (selectedCategory == "Clothing") {
            return clothing.count
        }else if (selectedCategory == "Gadgets") {
            return gadgets.count
        }else if (selectedCategory == "Miscellaneous") {
            return misc.count
        }
        return essentials.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let itemName = cell.viewWithTag(1) as! UILabel
        let toggleSwitch = cell.viewWithTag(2) as! UISwitch

        if (selectedCategory == "Essentials") {
            itemName.text = essentials[indexPath.row]
            toggleSwitch.accessibilityIdentifier = "\(indexPath.row)"
            if ViewController.usefulValues.essentials.contains(itemName.text!) {
                toggleSwitch.isOn = true
            }
        }else if (selectedCategory == "Documents") {
            itemName.text = documents[indexPath.row]
            toggleSwitch.accessibilityIdentifier = "\(indexPath.row)"
            if ViewController.usefulValues.documents.contains(itemName.text!) {
                toggleSwitch.isOn = true
            }
        }else if (selectedCategory == "Clothing") {
            itemName.text = clothing[indexPath.row]
            toggleSwitch.accessibilityIdentifier = "\(indexPath.row)"
            if ViewController.usefulValues.clothing.contains(itemName.text!) {
                toggleSwitch.isOn = true
            }
        }else if (selectedCategory == "Gadgets") {
            itemName.text = gadgets[indexPath.row]
            toggleSwitch.accessibilityIdentifier = "\(indexPath.row)"
            if ViewController.usefulValues.gadgets.contains(itemName.text!) {
                toggleSwitch.isOn = true
            }
        }else if (selectedCategory == "Miscellaneous") {
            itemName.text = misc[indexPath.row]
            toggleSwitch.accessibilityIdentifier = "\(indexPath.row)"
            if ViewController.usefulValues.misc.contains(itemName.text!) {
                toggleSwitch.isOn = true
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Click the toggle switch to select/deselect an item"
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        var header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel!.textColor = UIColor.white
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        if sender.isOn {
            if (selectedCategory == "Essentials") {
                print("selected item is \(essentials[Int(sender.accessibilityIdentifier!)!])")
                ViewController.usefulValues.essentials.append(essentials[Int(sender.accessibilityIdentifier!)!])
            }else if (selectedCategory == "Documents") {
                print("selected item is \(documents[Int(sender.accessibilityIdentifier!)!])")
                ViewController.usefulValues.documents.append(documents[Int(sender.accessibilityIdentifier!)!])
            }else if (selectedCategory == "Clothing") {
                print("selected item is \(clothing[Int(sender.accessibilityIdentifier!)!])")
                ViewController.usefulValues.clothing.append(clothing[Int(sender.accessibilityIdentifier!)!])
            }else if (selectedCategory == "Gadgets") {
                print("selected item is \(gadgets[Int(sender.accessibilityIdentifier!)!])")
                ViewController.usefulValues.gadgets.append(gadgets[Int(sender.accessibilityIdentifier!)!])
            }else if (selectedCategory == "Miscellaneous") {
                print("selected item is \(misc[Int(sender.accessibilityIdentifier!)!])")
                ViewController.usefulValues.misc.append(misc[Int(sender.accessibilityIdentifier!)!])
            }

        }else {
            if (selectedCategory == "Essentials") {
                if let index = ViewController.usefulValues.essentials.firstIndex(of: essentials[Int(sender.accessibilityIdentifier!)!]) {
                    ViewController.usefulValues.essentials.remove(at: index)
                }
            }else if (selectedCategory == "Documents") {
                if let index = ViewController.usefulValues.documents.firstIndex(of: documents[Int(sender.accessibilityIdentifier!)!]) {
                    ViewController.usefulValues.documents.remove(at: index)
                }
            }else if (selectedCategory == "Clothing") {
                if let index = ViewController.usefulValues.clothing.firstIndex(of: clothing[Int(sender.accessibilityIdentifier!)!]) {
                    ViewController.usefulValues.clothing.remove(at: index)
                }
            }else if (selectedCategory == "Gadgets") {
                if let index = ViewController.usefulValues.gadgets.firstIndex(of: gadgets[Int(sender.accessibilityIdentifier!)!]) {
                    ViewController.usefulValues.gadgets.remove(at: index)
                }
            }else if (selectedCategory == "Miscellaneous") {
                if let index = ViewController.usefulValues.misc.firstIndex(of: misc[Int(sender.accessibilityIdentifier!)!]) {
                    ViewController.usefulValues .misc.remove(at: index)
                }
            }

        }
    }
}
