//
//  SubtopicViewController.swift
//  SmartNote
//
//  Created by Student on 09/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class SubtopicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CanReceiveSub {
    
    func passDataBack(data: String) {
        novaPasta = data
    }
    
    var novaPasta: String!
    var pastas2 = [SubPasta]()

    @IBOutlet weak var subtopicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // pastas2 = Pasta2DAO.getList()
        
        subtopicTableView.delegate = self
        subtopicTableView.dataSource = self
//          self.hideKeyboardWhenTappedAround()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastas2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subtopicCell", for: indexPath)
        
        if let subtopicCell = cell as? SubtopicTableViewCell {
            
            let pasta2 = pastas2[indexPath.row]
            
            subtopicCell.subtopicName.text = pasta2.nomeSubPasta
            
            
            return subtopicCell
        }
        
        return cell
    }
    

    
    
    @IBAction func update(_ sender: Any) {
         appendNewFolder()
    }
    
    func appendNewFolder(){
        if novaPasta != nil{
            pastas2.append(SubPasta(nome: self.novaPasta, arquivos: [Arquivo]()))
            novaPasta = nil
        }
        self.subtopicTableView.reloadData()
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let novaView = segue.destination as? ArquivosTableViewController {
            
            let celulaSelecionada = subtopicTableView.indexPathForSelectedRow?.row
            let subtopicCell = pastas2[celulaSelecionada!]
            novaView.arquivos = subtopicCell.arquivos
        }
        
        if segue.identifier == "subTopic"{
                  let received = segue.destination as! CreateSubTopicViewController
                  received.delegate = self
                          
            }
        

    }

}

