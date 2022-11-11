//
//  CreateTopicViewController.swift
//  SmartNote
//
//  Created by Student on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

protocol CanReceive {
    
    func passDataBack(data:String)
}


class CreateTopicViewController: UIViewController {
    
    @IBOutlet weak var topicName: UITextField!
    var delegate: CanReceive?
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func createNewTopic(_ sender: Any) {
        
        print("created")
        
        delegate?.passDataBack(data: topicName.text!)
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
     
    }
    
   
    

}
