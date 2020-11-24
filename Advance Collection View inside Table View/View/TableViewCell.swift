//
//  TableViewCell.swift
//  Advance Collection View inside Table View
//
//  Created by Adwait Barkale on 24/11/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var isBigger = false
    var isRow3 = false
    
    
    func configure(isBig: Bool) {
           isBigger = isBig
           collectionView.delegate = self
           collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        if isBigger{
            flowLayout.itemSize = CGSize(width: 300, height: 190)
        }else{
            flowLayout.itemSize = CGSize(width: 160, height: 120)
        }
        
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        flowLayout.scrollDirection = .horizontal
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
        
       }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
   

}

extension TableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isBigger{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "big", for: indexPath) as! CollectionViewCell
            cell.lblTitle.text = "Title \(indexPath.row + 1)"
            cell.lblDescription.text = "Description \(indexPath.row + 1)"
            cell.image.contentMode = .scaleAspectFill
             cell.image.image = UIImage(named: "ff")
            
            if isRow3{
                cell.lblDescription.text = "This is Row 3"
            }
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "small", for: indexPath) as! CollectionViewCell
            cell.lblTitle.text = "Title \(indexPath.row + 1)"
            cell.lblDescription.text = "Description \(indexPath.row + 1)"
            cell.image.contentMode = .scaleAspectFill
            cell.image.image = UIImage(named: "gg")
            return cell
        }
    }
}
