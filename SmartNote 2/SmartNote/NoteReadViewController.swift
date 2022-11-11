//
//  NoteReadViewController.swift
//  SmartNote
//
//  Created by Student on 10/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class NoteReadViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    
    var dado: Arquivo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.text = dado?.texto
        // Do any additional setup after loading the view.
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
