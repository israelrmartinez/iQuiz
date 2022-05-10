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
        Quiz(id: 1, name: "Math", image: "math"),
        Quiz(id: 2, name: "Marvel", image: "marvel"),
        Quiz(id: 3, name: "Science", image: "science")
    ]
    
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
