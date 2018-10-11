//
//  Settings.swift
//  TriviaGame
//
//  Created by Emily Baker-King on 10/11/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class Settings: UIViewController {

    @IBOutlet weak var addQuestionTextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    @IBOutlet weak var addQuestionButton: UIButton!
    @IBOutlet weak var chooseNumber: UISegmentedControl!
    
    var newQuestion: TriviaQuestion!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please enter text in all fields, or hit the back button to go back to the home screen.", preferredStyle: .alert)
        let dismissedAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        errorAlert.addAction(dismissedAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func addQuestionClicked(_ sender: Any) {
        
        guard let question = addQuestionTextField.text, !question.isEmpty,
        let answer1 = answer1TextField.text, !answer1.isEmpty,
        let answer2 = answer2TextField.text, !answer2.isEmpty,
        let answer3 = answer3TextField.text, !answer3.isEmpty,
        let answer4 = answer4TextField.text, !answer4.isEmpty else {
                showErrorAlert()
                return
        }
        
        newQuestion = TriviaQuestion(question: question, answers: [answer1, answer2, answer3, answer4], correctAnswerIndex: chooseNumber.selectedSegmentIndex)
        
        self.performSegue(withIdentifier: "unwindToHomeScreen", sender: self)
        
    }

    
   
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController {
            //Append the new question to the qurstions array
            destination.userQuestions.append(newQuestion)
        }
    }
    

}
