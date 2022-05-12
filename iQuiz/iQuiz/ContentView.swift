//
//  ContentView.swift
//  iQuizie
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var myQuizzes = [
        Quiz(quizName: "Math", quizImage: "math"),
        Quiz(quizName: "Marvel", quizImage: "marvel"),
        Quiz(quizName: "Science", quizImage: "science")
    ]
    
//    var xQuizzes = [
//        XQuiz([ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
//               "questions":[
//                 ["text":"Who is Iron Man?",
//                   "answer":"1",
//                   "answers":[
//                     "Tony Stark",
//                     "Obadiah Stane",
//                     "A rock hit by Megadeth",
//                     "Nobody knows"]
//                 ],
//                 ["text":"Who founded the X-Men?",
//                   "answer":"2",
//                   "answers":[
//                     "Tony Stark",
//                     "Professor X",
//                     "The X-Institute",
//                     "Erik Lensherr"]
//                 ],
//                 ["text":"How did Spider-Man get his powers?",
//                   "answer":"1",
//                   "answers":[
//                     "He was bitten by a radioactive spider",
//                     "He ate a radioactive spider",
//                     "He is a radioactive spider",
//                     "He looked at a radioactive spider"]
//                 ]
//               ]
//         ])
//    ]
    
    var body: some View {
        NavigationView {
            VStack {
                QuizList(quizzes: myQuizzes)
            }
            .navigationTitle("iQuiz")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Settings") {
                        showingAlert = true
                    }
                    Spacer()
                }
            }
            .padding()
            .alert("Settings go here", isPresented: $showingAlert, actions: {})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
