//: Playground - noun: a place where people can play

import UIKit
import GameKit
import AudioToolbox

let trivia: [[String : String]] = [
    ["Question": "Only female koalas can whistle", "Answer": "False"],
    ["Question": "Blue whales are technically whales", "Answer": "True"],
    ["Question": "Camels are cannibalistic", "Answer": "False"],
    ["Question": "All ducks are birds", "Answer": "True"]
]

struct QuestionsModel {
    let question = [
        ["Question": "This was the only US President to serve more than two terms", "OptionOne": "George Washington", "OptionTwo": "Franklin D. Roosevelt", "OptionThree": "Woodrow Wilson", "OptionFour": "Andrew Jackson", "Answer": "OptionTwo"],
        ["Question": "Which of the following coutnries has the most residents?", "OptionOne": "Nigeria", "OptionTwo": "Russia", "OptionThree": "Iran", "OptionFour": "Vietnam", "Answer": "OptionOne"],
        ["Question": "In what year was the United Nations founded?", "OptionOne": "1918", "OptionTwo": "1919", "OptionThree": "1945", "OptionFour": "1954", "Answer": "OptionThree"],
        ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?", "OptionOne": "Paris", "OptionTwo": "Washington D.C", "OptionThree": "New York City", "OptionFour": "Boston", "Answer": "OptionThree"],
        ["Question": "Which nation produces the most oil?", "OptionOne": "Iran", "OptionTwo": "Iraq", "OptionThree": "Brazil", "OptionFour": "Canada", "Answer": "OptionFour"],
        ["Question": "Which country has most recently won consecutive World Cups in Soccer?", "OptionOne": "Italy", "OptionTwo": "Brazil", "OptionThree": "Argentina", "OptionFour": "Spain", "Answer": "OptionTwo"],
        ["Question": "Which of the following rivers is longest?", "OptionOne": "Yangtze", "OptionTwo": "Mississippi", "OptionThree": "Congo", "OptionFour": "Mekong", "Answer": "OptionTwo"],
        ["Question": "Which city is oldest?", "OptionOne": "Mexico City", "OptionTwo": "Cape Town", "OptionThree": "San Juan", "OptionFour": "Sydney", "Answer": "OptionOne"],
        ["Question": "Which country was the first to allow women to vote in national elections?", "OptionOne": "Polan", "OptionTwo": "United States", "OptionThree": "Sweden", "OptionFour": "Senegal", "Answer": "OptionOne"],
        ["Question": "Which of these countries won the most medals in 2012 Summer Games?", "OptionOne": "France", "OptionTwo": "Germany", "OptionThree": "Japan", "OptionFour": "Great Britain", "Answer": "OptionFour"]
    ]
}

trivia[0]

let questionsModel = QuestionsModel()
var indexOfSelectedQuestion: Int = 0

questionsModel.question[0]
questionsModel.question[0]["Question"]
questionsModel.question.count

func displayQuestion() {
    indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(questionsModel.question.count)
    let questionDictionary = questionsModel.question[indexOfSelectedQuestion]
    let questionField = questionDictionary["Question"]
    let buttonOneText = "\(questionDictionary["OptionOne"]!)"
}

//optionOneButton.setTitle("\(questionDictionary["OptionOne"])", forState: .Normal)

displayQuestion()

let selectedQuestionDict = questionsModel.question[indexOfSelectedQuestion]
let correctAnswer = selectedQuestionDict["Answer"]






