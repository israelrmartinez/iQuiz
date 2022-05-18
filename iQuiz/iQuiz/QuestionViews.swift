//
//  QuestionViews.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI
import Foundation

class UserModel: ObservableObject {
    @Published var views: [QuestionView] = []
    @Published var questions: [Question] = []
    @Published var activeIndex: Int = 0
    @Published private var wrongAnswers: [Question] = []
    @Published private var correctAnswers: [Question] = []
    @Published var showResults = false
    @Published var score = 0
    @Published var total = 0
    
    func getViews() {
        var setViews: [QuestionView] = []
        for question in questions {
            setViews.append(QuestionView(question: question))
//            question.isActive = false
        }
        if setViews.count <= 1 {
            self.showResults = true
        }
        self.views = setViews
    }
    
    func setQuestions(_ questions: [Question]) {
        self.questions = questions
        self.total = questions.count
        print("active: \(activeIndex)")
    }
    
    func updateIndex() {
        self.activeIndex += 1
        if activeIndex == views.count - 1 {
            self.showResults = true
            print("i'm out of index")
        } else if views.count == 1 {
            self.showResults = true
            print("I only have one question")
        }
    }
    
    func calculateScore() {
        for question in questions {
            if question.isCorrect == true {
                self.score += 1
                correctAnswers.append(question)
            } else {
                wrongAnswers.append(question)
            }
        }
    }
}

struct QuestionViews: View {
    @ObservedObject var userModel: UserModel = UserModel()
    
    init(_ quests: [Question]) {
        self.userModel.setQuestions(quests)
        self.userModel.getViews()
    }
    
    var body: some View {
        VStack {
            currentView
            nextView.navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    var currentView: some View {
        AnyView(userModel.views[userModel.activeIndex])
    }
    
    @ViewBuilder
    var nextView: some View {
        if userModel.showResults != true {
            AnyView(NavigationLink(destination:{
                ChangeView(userModel: userModel)
            }, label: {Text("Continue")}))
        } else {
            AnyView(NavigationLink(destination: ResultsList(userModel: userModel), label: {Text("View results")}))
                .onAppear {
                    userModel.calculateScore()
                }
        }
    }
}

struct ChangeView: View {
    @ObservedObject var userModel: UserModel
    
    var body: some View {
        currentView.onAppear {
            userModel.updateIndex()
        }
        nextView.navigationBarHidden(true)
    }
    
    @ViewBuilder
    var currentView: some View {
        if userModel.activeIndex < userModel.questions.count {
            AnyView(userModel.views[userModel.activeIndex])
        }
    }
    
    @ViewBuilder
    var nextView: some View {
        if userModel.showResults != true {
            AnyView(NavigationLink(destination:{
                ChangeView(userModel: userModel)
            }, label: {Text("Continue")}))
        } else {
            AnyView(NavigationLink(destination: ResultsList(userModel: userModel), label: {Text("View results")}))
                .onAppear {
                    userModel.calculateScore()
                }
        }
    }
}

struct QuestionView: View {
    @State var selection: String = ""
    @State var didTap: [Bool] = [false, false, false, false]
    @State var submitted: Bool = false
    
    var question: Question
    var body: some View {
        List {
            Section( header:
                        Text(question.text)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            ) {
                ForEach(question.answers.indices) { index in
                    HStack {
                        Text(question.answers[index])
                            .frame(maxWidth: .infinity)
                            .background(didTap[index] ? Color.yellow : Color.clear)
                    }
                    .onTapGesture {
                        question.selection = question.answers[index]
                        for i in 0..<question.answers.count {
                            self.didTap[i] = false
                        }
                        didTap[index].toggle()
                        print("Selection: \(question.selection)")
                    }
                }
                submitButton
            }
            theAnswer
        }
    }
    
    @ViewBuilder
    var submitButton: some View {
        if question.selection != "" && submitted == false {
            AnyView(Button("Submit", action: {
                checkAnswer()
            }))
        } else {
            AnyView(Text(""))
        }
    }
    
    @ViewBuilder
    var theAnswer: some View {
        if submitted == true && question.selection == question.answer {
            AnyView(Text("CORRECT! The answer was \(question.answer)"))
        } else if submitted == true && question.selection != question.answer {
            AnyView(Text("WRONG! The answer was \(question.answer)"))
        } else {
            AnyView(Text(""))
        }
    }

    
    func checkAnswer() {
        print("submitted: \(question.selection)")
        self.submitted = true
        if question.selection != question.answer {
            question.isCorrect = false
            print("selection \(question.selection) = \(question.answer) : \(question.isCorrect)")
        } else {
            question.isCorrect = true
            print("correct! \(question.isCorrect)")
        }
    }
}

struct QuestionViews_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViews(quesQuiz.questions)
            .previewInterfaceOrientation(.portrait)
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
