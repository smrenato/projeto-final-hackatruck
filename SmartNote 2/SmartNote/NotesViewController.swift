//
//  NotesViewController.swift
//  NotesPrototype
//
//  Created by Student on 04/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit
protocol CanReceiveNote {
    
    func passDataBack(data:String)
}


class NotesViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    var delegate: CanReceiveNote?
    var data = " "
    //public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        
            delegate?.passDataBack(data: noteTextView.text!)
                dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
    }
  
        
    
}
