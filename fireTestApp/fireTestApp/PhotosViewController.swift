//
//  PhotosViewController.swift
//  fireTestApp
//
//  Created by Nikolay Kryuchkov on 18.01.2021.
//

import UIKit
import Firebase

struct ImageItems {
    var name: String
    var liked: Bool
}

struct GlobalVariables {
//    static var photos = ["dog0","dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    static var photos: [Int: ImageItems] = [0: ImageItems(name: "dog0", liked: true),
                                            1: ImageItems(name: "dog1", liked: false),
                                            2: ImageItems(name: "dog2", liked: true),
                                            3: ImageItems(name: "dog3", liked: false),
                                            4: ImageItems(name: "dog4", liked: true)]
}

class PhotosViewController: UICollectionViewController {

    let paddingWidth: CGFloat = 3
    let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
        
        // Count size of item based on screen size
        let paddingTotalWidth = paddingWidth * (itemsPerRow + 1)
        let itemWidth = CGFloat(Int( (collectionView.frame.width - paddingTotalWidth) / itemsPerRow ))
        
        // Set layout parameters
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: paddingWidth
                                           , left: paddingWidth
                                           , bottom: paddingWidth
                                           , right: paddingWidth)
        layout.minimumLineSpacing = paddingWidth
        layout.minimumInteritemSpacing = paddingWidth
        layout.estimatedItemSize = CGSize(width: 0, height: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        // Turn off scroll indicator
        collectionView.showsVerticalScrollIndicator = false

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return GlobalVariables.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
//        cell.backgroundColor = .systemGray5
        
        let imageName = GlobalVariables.photos[indexPath.item]!.name
//        print(imageName)
        let image = UIImage(named: imageName)
        cell.cellImageView.image = image
        cell.imageID = indexPath.item
        
//        collectionView.reloadData()
        
        return cell
    }

}
