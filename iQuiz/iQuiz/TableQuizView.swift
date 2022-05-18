//
//  SwiftUIView.swift
//  iQuiz
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct QuizList: View {
//    @Binding var setQuizzes: [Quiz]
    @Binding var apiModel: ApiModel
    
    var body: some View {
        List(apiModel.quizzes) {
            quiz in ListRow(oneQuiz: quiz)
        }
    }
}

struct ListRow: View {
    var oneQuiz: Quiz
    var body: some View {
        VStack {
            HStack {
                Image(oneQuiz.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40)
                Text(oneQuiz.title)
            }
            NavigationLink(destination: QuizView(quiz: oneQuiz), label: {Text("Go")})
        }
    }
    
    func getTitleView() {
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var quizzies = myQuizzes as! Binding<[Quiz]>
    static var model = ApiModel() as! Binding<ApiModel>
    static var previews: some View {
        QuizList(apiModel: model)
    }
}

var myQuizzes = [
    Quiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
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
