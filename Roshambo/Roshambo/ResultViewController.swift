//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Tabassum Tamanna on 11/20/20.
//

import UIKit

class ResultViewController: UIViewController {

    
    var resultMsg: String?
    var resultVal: Int?
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        self.resultLabel.text = resultMsg
        
        switch self.resultVal {
        
        case 1:
            self.resultImage.image = UIImage(named: "RockCrushesScissors")
        case 2:
            self.resultImage.image = UIImage(named: "PaperCoversRock")
        case 3:
            self.resultImage.image = UIImage(named: "ScissorsCutPaper")
        default:
            self.resultImage.image = UIImage(named: "itsATie");
        }
       
        
    }

    
    /**
    *    dismiss this view controller
    */
    @IBAction  func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
