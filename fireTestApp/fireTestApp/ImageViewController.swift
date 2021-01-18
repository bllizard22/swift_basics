//
//  ImageViewController.swift
//  fireTestApp
//
//  Created by Nikolay Kryuchkov on 18.01.2021.
//

import UIKit
import FirebaseStorage

class ImageViewController: UIViewController {

    let storage = Storage.storage(url:"gs://firephotos-40d70.appspot.com")
    var storageSize: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storageRef = storage.reference().child("images")
        
    // Download 1.jpg from Storage and set it as image in ImageView
        let imageRef = storageRef.child("1.jpg")
        
        imageRef.getData(maxSize: 1 * 1024 * 1024) { [weak self] data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print("get Error\n",error)
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            self?.imageView.image = image
          }
        }
        
        
    // List all images in Storage
        storageRef.listAll { [weak self] (result, error) in
          if let error = error {
            print("list Error\n", error)
          }
          for prefix in result.prefixes {
//            print(prefix)
          }
          for item in result.items {
//            print(item)
          }
            self?.storageSize = String(result.items.count)
            print(self!.storageSize)
        }
        
    // Paginating
        listAllPaginated()
        
    }
    
    func listAllPaginated(pageToken: String? = nil) {
//      let storage = Storage.storage()
      let storageReference = storage.reference().child("images")

      let pageHandler: (StorageListResult, Error?) -> Void = { (result, error) in
        if let error = error {
            print("paginating Error\n", error)
        }
        let prefixes = result.prefixes
        let items = result.items
        print(items.count)
        
        items[0].getData(maxSize: 1 * 1024 * 1024) { [weak self] data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print("get Error\n",error)
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            self?.imageView.image = image
          }
        }

        for item in items {
            print(item)
        }

        // Process next page
        if let token = result.pageToken {
          self.listAllPaginated(pageToken: token)
        }
      }

      if let pageToken = pageToken {
        storageReference.list(maxResults: 2, pageToken: pageToken, completion: pageHandler)
      } else {
        storageReference.list(maxResults: 2, completion: pageHandler)
      }
    }

}
