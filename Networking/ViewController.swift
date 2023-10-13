//
//  ViewController.swift
//  Networking
//
//  Created by Ricardo Rodriguez on 10/11/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var downloadImageButton: UIButton!
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        emailLabel.text = ""
        idLabel.text = ""
        ActivityIndicator.hidesWhenStopped = true
        ActivityIndicator.stopAnimating()
        
    }

    @IBAction func getUserAction(_ sender: Any) {
        
        ActivityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 5358383) { (user) in
            //628217 || 628231 || 5358383 || 5358401
            self.ActivityIndicator.stopAnimating()
            
            self.setup(user: user)
            
        } failure: { (error) in
            
            self.ActivityIndicator.stopAnimating()
            
            self.nameLabel.text = error.debugDescription
            self.nameLabel.numberOfLines = 0
            print(error.debugDescription)
        }

    }
    
    @IBAction func addUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "RicardoDev", email: "ricardo@gmail.com", gender: "Male", status: "Active")
        
        ActivityIndicator.startAnimating()
        
        NetworkingProvider.shared.addUser(user: newUser) { (user) in
            
            //628217 || 628231
            self.ActivityIndicator.stopAnimating()
            
            self.setup(user: user)
            
        } failure: { (error) in
            
            self.ActivityIndicator.stopAnimating()
            
            self.nameLabel.text = error.debugDescription
            self.nameLabel.numberOfLines = 0
            print(error.debugDescription)
        }

        
    }
    
    @IBAction func updateUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "RicardoDev", email: "ricardodev@mymail.com", gender: nil, status: nil)
        
        ActivityIndicator.startAnimating()
        
        NetworkingProvider.shared.updateUser(id: 5358401, user: newUser) { (user) in
            
            //628217 || 628231
            self.ActivityIndicator.stopAnimating()
            
            self.setup(user: user)
            
        } failure: { (error) in
            
            self.ActivityIndicator.stopAnimating()
            
            self.nameLabel.text = error.debugDescription
            self.nameLabel.numberOfLines = 0
            print(error.debugDescription)
        }
    }
    
    @IBAction func deleteUserAction(_ sender: Any) {
        ActivityIndicator.startAnimating()
        
        let id = 5358401
        
        NetworkingProvider.shared.deleteUser(id: id) {
            self.ActivityIndicator.stopAnimating()
            self.nameLabel.text = "Se ha borrado el usuario con ID: \(id)"
            self.emailLabel.text = ""
            self.idLabel.text = ""
            
        } failure: { error in
            self.ActivityIndicator.stopAnimating()
            
            self.nameLabel.text = String(error.debugDescription)
            self.nameLabel.numberOfLines = 0
            print(error.debugDescription)
            print(error?.localizedDescription ?? "no hay error")
            print(error?.asAFError?.responseContentType ?? "no hay error")
        }

    }
    
    private func setup(user: UserResponse) {
        
        self.nameLabel.text = "Nombre: \(String(describing: user.name!))"
        self.nameLabel.numberOfLines = 0
        self.emailLabel.text = "Email: \(String(describing: user.email!))"
        self.emailLabel.numberOfLines = 0
        self.idLabel.text = "id: \(String(describing: user.id!))"
        self.idLabel.numberOfLines = 0
        
    }
    
    @IBAction func downloadImageAction(_ sender: Any) {
        downloadImageButton.isHidden = true
        
        logoImageView.kf.setImage(with: URL(string: "https://developer.apple.com/swift/images/swift-og.png"))
        
    }
    
    
}

