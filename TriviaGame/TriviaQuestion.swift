//
//  TriviaQuestion.swift
//  TriviaGame
//
//  Created by Emily Baker-King on 10/9/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation


class TriviaQuestion: NSObject, NSCoding {
    //String storing the text of the question
    let question: String
    
    //String array srtoring the potential answers to the questions
    let answers: [String]
    
    //Store the index of the correct answer in the answers array.
    let correctAnswerIndex: Int
    
    
    //computed property that returns the correct answer for the Trivia Question
    var correctAnswer: String {
        return answers[correctAnswerIndex]
    }
    
    //Initializer for the TriviaQuestion class
    init(question: String, answers: [String], correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(question, forKey: "question")
        aCoder.encode(answers, forKey: "answers")
        aCoder.encode(correctAnswerIndex, forKey: "correctAnswerIndex")
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let question = aDecoder.decodeObject(forKey: "question") as? String
            else {
                return nil
        }
        
        guard let answers = aDecoder.decodeObject(forKey: "answers") as? [String]
            else {
                return nil
        }
        
        let correctAnswerIndex = aDecoder.decodeInteger(forKey: "correctAnswerIndex")
        
        self.init(question: question, answers: answers, correctAnswerIndex: correctAnswerIndex)
    }
    
}
