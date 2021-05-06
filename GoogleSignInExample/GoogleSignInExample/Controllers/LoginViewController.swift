//
//  LoginViewController.swift
//  GoogleSignInExample
//
//  Created by Tabassum Tamanna on 4/12/21.
//

import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController, GIDSignInDelegate {
    
    

    @IBOutlet var signinButton: GIDSignInButton!
    
    @IBOutlet weak var showTaskListButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTaskListButton.isHidden = true
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
          
    }

    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("user email: \(user.profile.email ?? "No email")")
        
        if error != nil {
            print(error)
        }
        
        guard let authentication = user.authentication else { return }
         let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
         print(credential)
        
        showTaskListButton.isHidden = false
        signinButton.isHidden = true
    }
    
    @IBAction func showTaskList(_ sender: Any) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let taskVC = storyboard.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
        taskVC.modalPresentationStyle = .fullScreen 
        self.present(taskVC, animated: false, completion: nil)
    }
    
    
   
}

