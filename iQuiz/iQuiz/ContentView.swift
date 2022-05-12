//
//  ContentView.swift
//  iQuizie
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var myQuz = [
        Quizes(quizName: "Math", quizImage: "math"),
        Quizes(quizName: "Marvel", quizImage: "marvel"),
        Quizes(quizName: "Science", quizImage: "science"),
    ]
    let quiz = [Quiz(quiz:
        ["title":"hello", "desc":"world", "questions": ["yo":"hello"]])]
    
//    var xQuizzes = [
//        XQuiz()
//    ]
    
    var body: some View {
        NavigationView {
            VStack {
                QuizList(quzes: myQuz, quizzes: quiz)
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
