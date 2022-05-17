//
//  ResultsView.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI

struct ResultsList: View {
    @ObservedObject var userModel: UserModel
    
    var body: some View {
        Text("\(userModel.score) / \(userModel.total) correct")
        List(userModel.questions, id: \.self) {
            question in ResultRow(question: question)
        }
        NavigationLink(destination: ContentView().navigationBarHidden(true), label: {Text("Back to Home")})
            .isDetailLink(false)
            .navigationBarHidden(true)
    }
}

struct ResultRow: View {
    var question: Question
    var body: some View {
        resultView
    }
    
    @ViewBuilder
    var resultView: some View {
        if question.isCorrect == true {
            AnyView(
                HStack {
                    Text("\(question.text)")
                        .foregroundColor(.green)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Text("Correct!")
                        .foregroundColor(.green)
                }
            )
        } else {
            AnyView(
                VStack {
                    Spacer()
                    Text("\(question.text)")
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    HStack {
                        Text("Your answer: \(question.selection)")
                            .foregroundColor(.red)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("Correct: \(question.answer)")
                            .foregroundColor(.green)
                    }.fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
            )
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsList(userModel: UserModel())
    }
}
