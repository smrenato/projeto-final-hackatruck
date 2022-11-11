//
//  TopicCollectionViewCell.swift
//  SmartNote
//
//  Created by Student on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class TopicCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var topicImage: UIImageView!
    @IBOutlet weak var topicName: UILabel!
    
    
    func setup(with pasta:Pasta){
        topicName.text = pasta.nomePasta
        topicImage.image = UIImage(named: pasta.imagePath!)
    }
}
