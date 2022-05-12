//
//  QuestionViews.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI

struct QuestionViews: View {
    var quiz: Quiz
    var numQuestions: Int
    
    init(_ quiz: Quiz) {
        self.quiz = quiz
        self.numQuestions = quiz.questions[0].answers.count
    }
    
    var body: some View {
//        VStack {
//            Text(quiz.desc)
//            Text(quiz.title)
//            Text(quiz.questions[0].answer)
//        }
        QuestionView(question: quiz.questions[0])
    }
}

struct QuestionView: View {
    var question: Question
//    var quz: Quiz
//    print(question)
    var body: some View {
        VStack {
            Spacer()
            Text(question.text)
                .padding()
            Text(question.answer)
                .padding()
            Spacer()
        }
//        Text(quz["title"] as! String)
    }
//    func he() {
//        print(question)
//    }
}

struct QuestionViews_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViews(quesQuiz)
    }
}

let quesQuiz = Quiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
       "questions":[
         ["text":"Who is Iron Man?",
           "answer":"1",
           "answers":[
             "Tony Stark",
             "Obadiah Stane",
             "A rock hit by Megadeth",
             "Nobody knows"]
         ],
         ["text":"Who founded the X-Men?",
           "answer":"2",
           "answers":[
             "Tony Stark",
             "Professor X",
             "The X-Institute",
             "Erik Lensherr"]
         ],
         ["text":"How did Spider-Man get his powers?",
           "answer":"1",
           "answers":[
             "He was bitten by a radioactive spider",
             "He ate a radioactive spider",
             "He is a radioactive spider",
             "He looked at a radioactive spider"]
         ]
       ]
 ]
)
