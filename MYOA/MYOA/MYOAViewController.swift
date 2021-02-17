//
//  MYOAViewController.swift
//  MYOA
//
//  Created by Tabassum Tamanna on 12/14/20.
//

import UIKit

class MYOAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
        
    }
    
    @objc func startOver(){
        if let nevigationCOntroller = navigationController{
            nevigationCOntroller.popToRootViewController(animated: true)
        }
    }
    
    deinit{
        print("View Controller deallocated!")
    }

}

