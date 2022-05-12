//
//  QuestionView.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI

struct QuizView: View {
    var quiz: Quiz
    
    var body: some View {
//            Text("\(self.title) screen")
        VStack {
            Text(quiz.title)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            Spacer()
            Text(quiz.desc)
                .padding()
            NavigationLink(destination: QuestionViews(quiz), label: {Text("Go")})
            Spacer()
        }
    }
    
    func goToQuestion() {
        
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quiz: myQuiz)
    }
}

let myQuiz = Quiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
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
