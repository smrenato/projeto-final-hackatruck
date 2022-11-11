//
//  ArquivosTableViewController.swift
//  SmartNote
//
//  Created by Student on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class ArquivosTableViewController: UITableViewController, CanReceiveNote {
    
    func passDataBack(data:String){
        note = data
    }
    

    var note: String?
    var arquivos = [Arquivo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)


    }
    
    @objc func refresh(sender:AnyObject) {
       // Code to refresh table view
        appendNewFolder()
        self.refreshControl!.endRefreshing()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arquivos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath)

        if let arquivoCell = cell as? ArquivoTableViewCell {
            
            let arquivo = arquivos[indexPath.row]
            
            arquivoCell.dataArquivo.text = arquivo.data
            arquivoCell.nomeArquivo.text = arquivo.nome
            
            return arquivoCell
            

        }
        
        return cell
    }
    
    
       func appendNewFolder(){
           if note != nil{
              arquivos.append(Arquivo(nome: "note", texto: note!))
                self.refreshControl!.endRefreshing()
                note = nil
                print("aqui ")
           }
           
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "noteRead" {
            if let novaView = segue.destination as? NoteReadViewController {
                let celulaNotaSelecionada = tableView.indexPathForSelectedRow?.row
                let notaDaCelula = arquivos[celulaNotaSelecionada!]
                novaView.dado = notaDaCelula
            }
        }
        
        if segue.identifier == "noteData"{
             let received = segue.destination as! NotesViewController
             received.delegate = self
                         
        }
    }
    
    

}
