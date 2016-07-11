//: Playground - noun: a place where people can play

import UIKit

let trivia: [[String : String]] = [
    ["Question": "Only female koalas can whistle", "Answer": "False"],
    ["Question": "Blue whales are technically whales", "Answer": "True"],
    ["Question": "Camels are cannibalistic", "Answer": "False"],
    ["Question": "All ducks are birds", "Answer": "True"]
]

struct QuestionsModel {
    let question = [
        ["Question": "This was the only US President to serve more than two terms", "Answer": "OptionTwo"],
        ["Question": "Which of the following coutnries has the most residents?", "Answer": "OptionFour"]
    ]
}

trivia[0]

let questionsModel = QuestionsModel()

questionsModel.question[0]
questionsModel.question[1]["Question"]

