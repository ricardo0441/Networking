//
//  ViewController.swift
//  Networking
//
//  Created by Ricardo Rodriguez on 10/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func getUserAction(_ sender: Any) {
        NetworkingProvider.shared.getUser(id: 628217)
    }
    
}

