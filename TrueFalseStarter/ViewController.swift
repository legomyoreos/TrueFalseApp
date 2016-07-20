//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Marvin Martinez.
//  Copyright © 2016 Marvin Martinez. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsModel = QuestionsModel()
    let questionsPerRound = 10
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var usedQuestions: NSMutableArray = []
    
    

    
    var gameSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var optionFourbutton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(questionsModel.question.count)
        let questionDictionary = questionsModel.question[indexOfSelectedQuestion]
        questionField.text = questionDictionary["Question"]
        optionOneButton.setTitle("\(questionDictionary["OptionOne"]!)", forState: .Normal)
        optionTwoButton.setTitle("\(questionDictionary["OptionTwo"]!)", forState: .Normal)
        optionThreeButton.setTitle("\(questionDictionary["OptionThree"]!)", forState: .Normal)
        optionFourbutton.setTitle("\(questionDictionary["OptionFour"]!)", forState: .Normal)
        playAgainButton.hidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        optionOneButton.hidden = true
        optionTwoButton.hidden = true
        optionThreeButton.hidden = true
        optionFourbutton.hidden = true
        
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }

    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = questionsModel.question[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === optionOneButton &&  correctAnswer == "OptionOne") || (sender === optionTwoButton && correctAnswer == "OptionTwo") || (sender === optionThreeButton && correctAnswer == "OptionThree") || (sender === optionFourbutton && correctAnswer == "OptionFour") {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }

        usedQuestions.addObject(selectedQuestionDict)
        loadNextRoundWithDelay(seconds: 2)
    }

    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        optionOneButton.hidden = false
        optionTwoButton.hidden = false
        optionThreeButton.hidden = false
        optionFourbutton.hidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        usedQuestions = []
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

