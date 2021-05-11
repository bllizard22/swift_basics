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
    
    private var imageURL: URL?
    private var image: UIImage? {
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
        delay(3) {
            self.alertLogin()
        }
    }
    
    private func delay(_ delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    private func alertLogin() {
        let alertC = UIAlertController(title: "Login?", message: "Please login", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertC.addAction(okAction)
        alertC.addAction(cancelAction)
        alertC.addTextField { (usernameTF) in
            usernameTF.placeholder = "Login"
        }
        alertC.addTextField { (passwordTF) in
            passwordTF.placeholder = "Password"
            passwordTF.isSecureTextEntry = true
        }
        
        self.present(alertC, animated: true, completion: nil)
    }
    
    private func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Apple_park_cupertino_2019.jpg/2880px-Apple_park_cupertino_2019.jpg")
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }

}
