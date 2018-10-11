//
//  ViewController.swift
//  TriviaGame
//
//  Created by Emily Baker-King on 10/8/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var intro: UILabel!
    
    var userQuestions: [TriviaQuestion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Label that welcomes the users
        welcomeLabel.text = "Welcome to the Trivia Game"
        
        //Label that describes what the game is about
        intro.text = "This is a game of random trivia, so let's see what kind of stuff you know!"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerPage2 {
            destination.questions.append(contentsOf: userQuestions)
        }
    }
    
    //Unwind seque to this screen
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        
    }

    
}

