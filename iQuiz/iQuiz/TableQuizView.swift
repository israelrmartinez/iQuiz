//
//  SwiftUIView.swift
//  iQuiz
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct QuizList: View {
    var quizzes: [Quizes]
    var xQuiz: [XQuiz]
    
    var body: some View {
        List(quizzes) {
            quiz in ListRow(eachQuiz: quiz)
        }
    }
}

struct ListRow: View {
    var eachQuiz: Quizes
    var body: some View {
        VStack {
            HStack {
                Image(eachQuiz.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40)
                Text(eachQuiz.title)
            }
            Text(eachQuiz.desc)
            NavigationLink(destination: {
                Label(
                    title: {Text("iQuiz")}, icon: {})
                    .padding()
                Text("\(eachQuiz.title) screen")
            }, label: {Text("Next screen")})
        }
    }
}

var myQuizzes = [
    Quizes(quizName: "Math", quizImage: "math"),
    Quizes(quizName: "Marvel", quizImage: "marvel"),
    Quizes(quizName: "Science", quizImage: "science")
]

var xQuizzes = [
    XQuiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
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
     ])
]

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuizList(quizzes: myQuizzes, xQuiz: xQuizzes)
    }
}
