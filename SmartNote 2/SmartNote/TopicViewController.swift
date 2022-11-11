//
//  TopicViewController.swift
//  SmartNote
//
//  Created by Student on 07/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController, CanReceive{
    
    
    
    
    func passDataBack(data: String) {
        novaPasta = data
    }

    @IBOutlet weak var topicCollectionView: UICollectionView!
    
    var novaPasta: String!
    var pastas: [Pasta] = PastaDAO.getList()
    var subPastas = [Pasta2DAO.getList(), Pasta2DAO.getList2(), Pasta2DAO.getList3()]

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicCollectionView.dataSource = self
        topicCollectionView.delegate = self
        topicCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
//        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    @IBAction func update(_ sender: Any) {
        
        appendNewFolder()
        
    }
    
    func appendNewFolder(){
        if novaPasta != nil{
            pastas.append(Pasta(nome: self.novaPasta, imagePath: "caderno"))
            novaPasta = nil
        }
        self.topicCollectionView.reloadData()
        
    }
    
 
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegue(withIdentifier: "subtopic", sender: indexPath.item)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "subtopic" {
            if let cell = sender as? UICollectionViewCell, let indexPath = self.topicCollectionView.indexPath(for: cell){
              let controller = segue.destination as! SubtopicViewController
              controller.pastas2 = subPastas[indexPath.row % 3]
                
                 print(indexPath.row)
            
          }
        }
        
        if segue.identifier == "createTopicSegue"{
                   let received = segue.destination as! CreateTopicViewController
                   received.delegate = self
                   
            }
    }
     


}



extension TopicViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pastas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicCollectionViewCell
        
        cell.setup(with: pastas[indexPath.row])
        return cell
    }
}

extension TopicViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }

   
}


extension TopicViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
//
//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}
