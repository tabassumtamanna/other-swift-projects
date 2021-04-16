//
//  ViewController.swift
//  GoogleSignInExample
//
//  Created by Tabassum Tamanna on 4/12/21.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet var signinButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }


}

