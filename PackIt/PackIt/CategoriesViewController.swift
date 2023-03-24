//
//  CategoriesViewController.swift
//  PackIt
//
//  Created by student on 10/25/22.
//

import UIKit
import SwiftUI

class CategoriesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fill // .fillEqually .fillProportionally .equalSpacing .equalCentering

        stackView.addArrangedSubview(addLable(text: "Passport"))
        stackView.addArrangedSubview(addSwitch())
        
        self.view.addSubview(stackView)
       
    }
    
    func addLable(text: String) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
            label.textAlignment = .center
            label.textColor = .white
            label.text = text

            return label
    }
    
    func addSwitch() -> UIView {
        let switchDemo=UISwitch(frame:CGRect(x: 150, y: 150, width: 0, height: 0))
                switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
                switchDemo.setOn(true, animated: false)
                return switchDemo
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch!)
        {
            if (sender.isOn == true){
                print("UISwitch state is now ON")
            }
            else{
                print("UISwitch state is now Off")
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
