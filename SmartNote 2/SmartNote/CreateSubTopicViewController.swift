//
//  CreateSubTopicViewController.swift
//  SmartNote
//
//  Created by Student on 10/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

protocol CanReceiveSub {
    
    func passDataBack(data:String)
}


class CreateSubTopicViewController: UIViewController {

    @IBOutlet weak var subTopic: UITextField!
    
    var delegate: CanReceiveSub?
    var data = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirm(_ sender: Any) {
        delegate?.passDataBack(data: subTopic.text!)
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
