//
//  SecondViewController.swift
//  GCDTutorial
//
//  Created by Nikolay Kryuchkov on 29.03.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imageURL: URL?
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Apple_park_cupertino_2019.jpg/2880px-Apple_park_cupertino_2019.jpg")
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }

}
