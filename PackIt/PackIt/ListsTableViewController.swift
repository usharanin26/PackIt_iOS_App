//
//  ListsTableViewController.swift
//  PackIt
//
//  Created by student on 10/26/22.
//

/*
 It displays all the packing lists created by the user so far
 The list can be clicked to see the selected items for each list
 The values of a list can be updated from the next page
 */

import UIKit

class ListsTableViewController: UITableViewController {
    var selectedList = ""
    var cancelAlertValue = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // hide the back button as the user is not supposed to go back from here
        self.navigationItem.setHidesBackButton(true, animated: true);
//        if ViewController.itenaryLists.keys.contains("No lists created!") {
//            ViewController.itenaryLists["No lists created!"] = nil
//        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if ViewController.itenaryLists.isEmpty {
//            print("list is empty")
//            ViewController.itenaryLists["No lists created!"] = []
//        }
        return ViewController.itenaryLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let button = cell.viewWithTag(1) as! UIButton
        
        button.setTitle(Array(ViewController.itenaryLists)[indexPath.row].key, for: .normal)
        button.addTarget(self, action: #selector(listSelectedAction), for: .touchUpInside)
        
        return cell
    }
    
    /*
     this is used to create the header section for the tableView
     we are creating a button called "Create New List" for a new packing list to be created from here
     */
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let myButton = UIButton(type: .system)
        myButton.setTitle("Create New List", for: .normal)
        myButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        myButton.titleLabel?.textColor = .white
        //myButton.backgroundColor = #colorLiteral(red: 0.9972484708, green: 0.5377130508, blue: 0.1859841645, alpha: 1)
        myButton.contentHorizontalAlignment = .right
        //myButton.rightAnchor.constraint(equalTo: )
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return myButton
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @objc func buttonAction(sender: UIButton!) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func listSelectedAction(sender: UIButton!) {
        selectedList = sender.title(for: .normal)!
        print("selected list is \(selectedList)")
        performSegue(withIdentifier: "listToDetailPage", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToDetailPage" {
            let detailsTableViewController = segue.destination as! DetailsTableViewController
            detailsTableViewController.selectedList = selectedList
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedList = Array(ViewController.itenaryLists)[indexPath.row].key
        performSegue(withIdentifier: "listToDetailPage", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to delete the list?", preferredStyle: .alert)

                    let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                        ViewController.itenaryLists[Array(ViewController.itenaryLists)[indexPath.row].key] = nil
                        ViewController.usefulValues.dict["listName"] = ""
                        self.tableView.deleteRows(at: [indexPath], with: .fade)
                    })
                    alertController.addAction(deleteAction)

                    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    alertController.addAction(cancelAction)

                    present(alertController, animated: true, completion: nil)
        }
    }
   
}
