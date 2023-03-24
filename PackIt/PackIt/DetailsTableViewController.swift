//
//  DetailsTableViewController.swift
//  PackIt
//
//  Created by student on 10/26/22.
//

/*
 This screen displays the items selected by the user in a given list
 The selected items can be updated/deleted by clicked the update button at the top
 */

import UIKit

class DetailsTableViewController: UITableViewController {
    
    var selectedList = ""
    
    lazy var itemsAr : [Array<String>] = ViewController.itenaryLists[selectedList]!
    var sections : [String] = ["Essentials", "Documents", "Clothing", "Gadgets", "Miscellaneous"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        /*
         Initalizing the list values with the selected list from the previous screen
         */
        
        ViewController.usefulValues.setEssentials(essentials: itemsAr[0])
        ViewController.usefulValues.setDocuments(documents: itemsAr[1])
        ViewController.usefulValues.setClothing(clothing: itemsAr[2])
        ViewController.usefulValues.setGadgets(gadgets: itemsAr[3])
        ViewController.usefulValues.setMisc(misc: itemsAr[4])
        ViewController.usefulValues.dict["listName"] = selectedList
        
        //print("essentials count is \(ViewController.usefulValues.getEssentials().count)")
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsAr[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = itemsAr[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = header.textLabel?.font.withSize(25)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if cell.backgroundColor ==  #colorLiteral(red: 0.9972484708, green: 0.5377130508, blue: 0.1859841645, alpha: 1){
            cell.backgroundColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            cell.contentView.backgroundColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
            cell.textLabel?.backgroundColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
        }else{
            //print("supposed to be here")
            cell.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            cell.contentView.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
            cell.textLabel?.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        }
    }
    
    @objc func rightHandAction(_ sender: Any) {
        performSegue(withIdentifier: "updateList", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
