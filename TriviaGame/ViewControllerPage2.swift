//
//  ViewControllerPage2.swift
//  TriviaGame
//
//  Created by Emily Baker-King on 10/9/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class ViewControllerPage2: UIViewController {
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var whatGif: UIImageView!
    
    
    //our array of questions for the trivia game
    var questions: [TriviaQuestion] = []
    
    //This array will hold all of the questions that have been answered
    var questionPlaceholder: [TriviaQuestion] = []
    
    
    var score = 0 {
        didSet {
            //property observer for score
            scoreLabel.text = "\(score)"
        }
    }
    
    //This will store the index of the current question
    var randomIndex: Int!
    
    
    //the current question that is being answered
    var currentQuestion: TriviaQuestion! {
        //property observer for currentQueston
        didSet {
            questionLabel.text = currentQuestion.question
            answer1Button.setTitle(currentQuestion.answers[0], for: .normal)
            answer2Button.setTitle(currentQuestion.answers[1], for: .normal)
            answer3Button.setTitle(currentQuestion.answers[2], for: .normal)
            answer4Button.setTitle(currentQuestion.answers[3], for: .normal)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        populateQuestions()
        getNewQuestion()
        scoreLabel.text = "\(score)"
        whatGif.isHidden = true
    }
    
    
    //This will be used to populate our questions array when the app loads.
    func populateQuestions() {
        //Put all of your questions in here
        let question1 = TriviaQuestion(question: "What is a flock of crows called?", answers: ["Gaggle", "Friends", "Murder", "Legion"], correctAnswerIndex: 2)
        let  question2 = TriviaQuestion(question: "In the movie The Wizard of Oz, what did the scarecrow want from the wizard?", answers: ["A heart", "A brain", "Courage", "A way home"], correctAnswerIndex: 1)
        let question3 = TriviaQuestion(question: "The Starry Night is an oil on canvas painted by who?", answers: ["Picasso", "Bob Ross", "Claude Monet", "Vincent van Gogh"], correctAnswerIndex: 3)
        let question4 = TriviaQuestion(question: "How many US states border the Pacific Ocean?", answers: ["5", "9", "2", "4"], correctAnswerIndex: 0)
        let question5 = TriviaQuestion(question: "Stratus, Cirrus, and Cumulus are types of what?", answers: ["Hills", "Clouds", "Ecosystems", "Animals"], correctAnswerIndex: 1)
        let question6 = TriviaQuestion(question: "Which Teenage Mutant Ninja Turtle always wears red bandanas?", answers: ["Leonardo", "Donatello", "Michelangelo", "Raphael"], correctAnswerIndex: 3)
        let question7 = TriviaQuestion(question: "What was the name of the Krusty Krab before Mr. Krabs bought it?", answers: ["Rusty Krab", "Dusty Krab", "Rowdy Krab", "Kuddly Krab"], correctAnswerIndex: 0)
        let question8 = TriviaQuestion(question: "What popular soda beverage was originally developed as a mixer for whiskey?", answers: ["Coke", "Sprite", "Mountain Dew", "Dr Pepper"], correctAnswerIndex: 3)
        let question9 = TriviaQuestion(question: "What year was the original Jurassic Park movie released?", answers: ["1993", "1994", "1992", "1995"], correctAnswerIndex: 0)
        let question10 = TriviaQuestion(question: "How many planets in our solar system have moons?", answers: ["4", "5", "6", "7"], correctAnswerIndex: 2)
        let question11 = TriviaQuestion(question: "In the movie Bambi, what type of animal is Bambi's friend Flower?", answers: ["Rabbit", "Owl", "Skunk", "Deer"], correctAnswerIndex: 2)
        let question12 = TriviaQuestion(question: "What is the longest running nickelodean series?", answers: ["Spongebob Squarepants", "The Fairly Odd Parents", "Rugrats", "Dora the Explorer"], correctAnswerIndex: 0)
        let question13 = TriviaQuestion(question: "What is the powerhouse of the cell?", answers: ["Chloroplasts", "Mitochondria", "Nucleus", "DNA"], correctAnswerIndex: 1)
        let question14 = TriviaQuestion(question: "How many stomachs does Appa from Avatar: The Last Airbender have?", answers: ["4", "5", "6", "7"], correctAnswerIndex: 1)
        let question15 = TriviaQuestion(question: "In Avatar: The Last Airbender, what air temple did Guru Pathik live at?", answers: ["Northern Air Temple", "Eastern Air Temple", "Southern Air Temple", "Western Air Temple"], correctAnswerIndex: 1)
        let question16 = TriviaQuestion(question: "In Avatar: The last Airbender, when Iroh created the ability to redirect lightning, what bending was he studying?", answers: ["Water bending", "Fire bending", "Earth bending", "Air bending"], correctAnswerIndex: 0)
        
        questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15, question16]
    }
    
    //This function will be used to get a random question from our array of questions
    func getNewQuestion() {
        if questions.count > 0 {
        //get a random index from 0 to 1 less than the number of elements in the questions array
        randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
        //Set currentQuestion equal to the question that is at the random index in the questions array.
        currentQuestion = questions[randomIndex]
        } else {
            //If there are no questions left, reset the game.
            resetGame()
        }
    }
    
    
    func resetGame() {
        //Reset the score
        score = 0
        //Repopulate the questions array with the questions in the placeholder
        if !questions.isEmpty {
            //If we have questions remaining, append all of the remaining questions to the placeholder array
            questionPlaceholder.append(contentsOf: questions)
        }
        questions = questionPlaceholder
        questionPlaceholder.removeAll()
        //Get a new question
        getNewQuestion()
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        resetGame()
    }
    
    
    func resetGameAlert() {
        //UIAlertController
        let resetAlert = UIAlertController(title: "Game stats", message: "You got \(score) questions right. Do you want to play again?", preferredStyle: .actionSheet)
        //UIAlertActions
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            self.resetGame()
        }
        let noAction = UIAlertAction(title: "No", style: .default) { _ in
            <#code#>
        }
        
    }
    
    
    //Show an alert when the user gets the question right
    func showCorrectAnswerAlert() {
        //UIAlertController
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        //UIAlertAction
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.questionPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        //add the action to the alert controller
        correctAlert.addAction(closeAction)
        //present the alert controller
        self.present(correctAlert, animated: true, completion: nil)
    }
    
    //Show an alert when the user gets the question wrong
    func showIncorrectAnswerAlert() {
        //UIAlertController
        let incorrectAlert = UIAlertController(title: "Incorrect Answer", message: "The correct answer was: \(currentQuestion.correctAnswer)", preferredStyle: .actionSheet)
        //UIAlertAction
        let closeAction2 = UIAlertAction(title: "Close", style: .default) { _ in
        self.questionPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        //add the action to the alert controller
        incorrectAlert.addAction(closeAction2)
        //present alert controller
        self.present(incorrectAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.tag == currentQuestion.correctAnswerIndex {
            //They get the question right, so we need to let them know
            showCorrectAnswerAlert()
            score += 1
        } else {
            //They got the question wrong, so we need to let them know
            showIncorrectAnswerAlert()
        }
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
