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
        List(quizzes) {
            quiz in ListRow(eachQuiz: quiz)
        }
    }
}

struct ListRow: View {
    var eachQuiz: Quiz
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
            NavigationLink(destination: Text("\(eachQuiz.title) screen"), label: {Text("Next screen")})
        }
    }
}

var myQuizzes = [
    Quiz(quizID: 1, quizName: "Math", quizImage: "math")
]

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuizList(quizzes: myQuizzes)
    }
}
