//
//  SwiftUIView.swift
//  iQuiz
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct QuizList: View {
    var quizzes: [Quiz]
    
    var body: some View {
        NavigationView {
            List(quizzes) {
                quiz in ListRow(eachQuiz: quiz)
            }
        }
    }
}

struct ListRow: View {
    var eachQuiz: Quiz
    var body: some View {
        HStack {
            Image(eachQuiz.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
            Text(eachQuiz.name)
        }
    }
}

var myQuizzes = [
    Quiz(id: 1, name: "Math", image: "math"),
    Quiz(id: 2, name: "Marvel", image: "marvel"),
    Quiz(id: 3, name: "Science", image: "science")
]

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuizList(quizzes: myQuizzes)
    }
}
