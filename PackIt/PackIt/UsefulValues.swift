//
//  UsefulValues.swift
//  PackIt
//
//  Created by student on 10/26/22.
//

import Foundation

class UsefulValues : Codable {
    
    var dict = [String : String]()
    var essentials = [String]()
    var documents = [String]()
    var clothing = [String]()
    var gadgets = [String]()
    var misc = [String]()
    
    func getEssentials () -> Array<String> {
        return essentials
    }
    func getDocuments () -> Array<String> {
        return documents
    }
    func getClothing () -> Array<String> {
        return clothing
    }
    func getGadgets () -> Array<String> {
        return gadgets
    }
    func getMisc () -> Array<String> {
        return misc
    }
    
    func getDict () -> Dictionary<String, String> {
        return dict
    }
    
    func setEssentials (essentials : Array<String>) {
        self.essentials = essentials
    }
    
    func setDocuments (documents : Array<String>) {
        self.documents = documents
    }
    func setClothing (clothing : Array<String>) {
        self.clothing = clothing
    }
    func setGadgets (gadgets : Array<String>) {
        self.gadgets = gadgets
    }
    func setMisc (misc : Array<String>) {
        self.misc = misc
    }
    
    func setDict (dict : Dictionary<String, String>) {
        self.dict = dict
    }
}
