//
//  QuestionViews.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI

struct QuestionViews: View {
    @State private var activeIndex = 0
    @State private var nextIndex = 1
    
    var questions: [Question]
    var numQuestions: Int
    var views: [QuestionView] = []
    var activeView: QuestionView?
//    var activeView: QuestionView = QuestionView(question: Question())
//    var activeView: QuestionView
    
    init(_ quests: [Question]) {
        self.questions = quests
        self.numQuestions = questions.count
        getViews()
        getActive()
//        self.activeView = views[0]
    }
    
    var body: some View {
        ForEach(questions.indices) { index in
            if numQuestions > activeIndex {
                
            }
        }
    }
    
    @ViewBuilder
    var currentView: some View {
        AnyView(
            VStack{
                views[activeIndex]
                NavigationLink(destination: views[nextIndex], label: {Text("Continue")})
            }
        )
    }
    
    @ViewBuilder
    var nextView: some View {
        AnyView(Text("test"))
    }
    
    mutating func getViews() {
        var setViews: [QuestionView] = []
        for question in questions {
            setViews.append(QuestionView(question: question))
//            question.isActive = false
        }
        self.views = setViews
    }
    
    mutating func getActive() {
        self.activeView = views[activeIndex]
    }
    
    mutating func detectActive() {
        if (questions.count > activeIndex || questions.count >= nextIndex) {
            for i in 0..<questions.count {
                if activeIndex == i {
                    questions[i].isActive = true
                }
                questions[i].isActive = false
            }
            self.activeIndex += 1
            self.nextIndex += 1
        }
    }
    
    func getDestinations(_ index: Int) -> QuestionView {
        if index < numQuestions {
            return views[index + 1]
        } else {
            return views[index]
        }
    }
}

struct QuestionView: View {
    @State var selection: String = ""
    @State var didTap: [Bool] = [false, false, false, false]
    @State var submitted: Bool = false
//    @State var submitButton = ""
//    @Published var counter: Int
    
    var question: Question
//    var quz: Quiz
//    print(question)
    var body: some View {
        List {
            Section( header: Text(question.text)) {
                ForEach(question.answers.indices) { index in
                    HStack {
                        Text(question.answers[index])
                            .frame(maxWidth: .infinity)
                            .background(didTap[index] ? Color.yellow : Color.clear)
//                        Button(action: {print("yuh")}, label: {"heloo"})
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
//                {
//                    self.selection != "" ?
//                    Button("Submit", action: {checkAnswer}) :
//                    Button("submit", action: checkAnswer).hidden()
//                }
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
//    func he() {
//        print(question)
//    }
}

struct QuestionViews_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViews(quesQuiz.questions)
            .previewInterfaceOrientation(.portraitUpsideDown)
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
