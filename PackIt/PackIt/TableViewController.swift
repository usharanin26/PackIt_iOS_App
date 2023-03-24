//
//  TableViewController.swift
//  PackIt
//
//  Created by student on 10/25/22.
//

/*
 this class is used to create the four essential categories of items to pack.
 Depending on the input given so far, the items that are going to appear in each category will vary
 The user can select any items and click on Done to create the packing list
 */
import UIKit

class TableViewController: UITableViewController {
    
    var categories : [String] = ["Essentials", "Documents", "Clothing", "Gadgets", "Miscellaneous"]
    var selectedCategory : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.01362123154, green: 0.1411163211, blue: 0.1695696115, alpha: 1)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightHandAction))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let categoryName = cell.viewWithTag(1) as! UILabel
        categoryName.text = categories[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pick Categories for Items to pack"
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        var header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel!.textColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoriesToItems" {
            let itemsPage = segue.destination as! ItemsTableViewController
            itemsPage.selectedCategory = selectedCategory
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        performSegue(withIdentifier: "categoriesToItems", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = #colorLiteral(red: 0.7813441388, green: 0.3179318476, blue: 0.2200977011, alpha: 1)
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button

    }
    
    @objc func buttonAction(sender: UIButton!) {
      //print("Button tapped")
        
        ViewController.itenaryLists[ViewController.usefulValues.dict["listName"]!] = [ViewController.usefulValues.getEssentials(),ViewController.usefulValues.getDocuments(),ViewController.usefulValues.getClothing(), ViewController.usefulValues.getGadgets(), ViewController.usefulValues.getMisc()]
        
        performSegue(withIdentifier: "itemsToLists", sender: self)
        
    }
    
    @objc func rightHandAction(_ sender: Any) {
       
        cancelAlert()
    }
    func cancelAlert() {
        let cancelAlertVar = UIAlertController(title: "Warning", message: "Are you sure you want to cancel creating the list?", preferredStyle: UIAlertController.Style.alert)

        cancelAlertVar.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "itemsToLists", sender: self)
        }))

        cancelAlertVar.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(cancelAlertVar, animated: true, completion: nil)
    }
    
    
}
