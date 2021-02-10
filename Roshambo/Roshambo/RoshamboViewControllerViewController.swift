//
//  RoshamboViewController.swift
//  Roshambo
//
//  Created by Tabassum Tamanna on 11/19/20.
//

import UIKit

class RoshamboViewController: UIViewController {

    
    var resultMsg: String = ""
    var resultImage: Int = 0
    
    /**
    * Randomly generates a Int from 1 to 3
    */
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    //MARK 1= rock 2=paper 3=scissors
    func gameOperation(firstVal: Int, secondVal: Int)  {
        
        
        resultMsg = ""
        resultImage = 0
        
        if (firstVal == 1 && secondVal == 2) || (firstVal == 2 && secondVal == 1){ // Rock Vs Paper
          
            resultImage = 2
            resultMsg = firstVal == 2 ? "You Win with Rock Vs Paper": "You loss with Rock Vs Paper"
            
        } else if (firstVal == 1 && secondVal == 3) || (firstVal == 3 && secondVal == 1){ // rock vs scissors
           
            resultImage = 1
            resultMsg = firstVal == 1 ? "You Win with Rock Vs Scissors": "You loss with Rock Vs Scissors"
            
        } else if (firstVal == 2 && secondVal == 3) || (firstVal == 3 && secondVal == 2){ //paper Vs scissors
           
            resultImage = 3
            resultMsg = firstVal == 3 ? "You Win with Paper Vs Scissors": "You loss with Paper Vs Scissors"
            
            
        } else { // tie
           
            resultImage = 0
            if( firstVal == 1){
                resultMsg = "Rock Vs Rock: its a tie"
            } else if( firstVal == 2) {
                resultMsg = "Paper Vs Paper: its a tie"
            } else if(firstVal == 3){
                resultMsg = "Scissors Vs Scissors: its a tie"
            }
        }
        
        print("f: \(firstVal) s: \(secondVal) => result: \(resultImage)")
        print(resultMsg)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func rockButton(){
        
        let randomVal = randomDiceValue()
        gameOperation(firstVal: 1, secondVal: randomVal)
        
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController

        controller.resultMsg = resultMsg
        controller.resultVal = resultImage
        
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func paperButton(){
        let randomVal = randomDiceValue()
        gameOperation(firstVal: 2, secondVal: randomVal)
        
        self.performSegue(withIdentifier: "paperClick", sender: self)
    }
    
    @IBAction func RockButton(){
        let randomVal = randomDiceValue()
        gameOperation(firstVal: 3, secondVal: randomVal)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "rockButton"){
            let randomVal = randomDiceValue()
            gameOperation(firstVal: 3, secondVal: randomVal)
            
        }
        let controller = segue.destination as! ResultViewController
        
        controller.resultMsg = resultMsg
        controller.resultVal = resultImage
        
        print("I am here\(String(describing: segue.identifier))")
    }
    
   
    
}

