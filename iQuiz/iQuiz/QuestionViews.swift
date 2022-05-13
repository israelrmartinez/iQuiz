//
//  QuestionViews.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI

struct QuestionViews: View {
    var questions: [Question]
    var numQuestions: Int
    var views: [QuestionView] = []
    @State private var counter = 0
    
    init(_ quests: [Question]) {
        self.questions = quests
        self.numQuestions = questions[0].answers.count
        getViews()
    }
    
    mutating func getViews() {
        var setViews: [QuestionView] = []
        for quest in questions {
            setViews.append(QuestionView(question: quest))
        }
        self.views = setViews
        
    }
    
    var body: some View {
//            Text(questions[0].text)
            
//            ForEach(questions.indices) { index in
//    //                Text("answer \(index): \(questions[index].answer)"
//                    if index < numQuestions {
//                        VStack {
//                            Text("index: \(index)")
//                            QuestionView(question: questions[index])
//                            NavigationLink(destination: getDestination(index), label: {Text("Next")})
//                        }
//                    } else {
//                        QuestionView(question: questions[index])
//                    }
//                }
//            Text("this view: \(views)")
//            ForEach(0..<self.counter) { index in
            
        VStack {
//                ForEach(0..<self.counter) { index in
//                    Text("\(self.counter)")
                    views[self.counter]
                    NavigationLink(destination: views[counter + 1], label: {Text("Continue")})
//                }
            }
        
//            }
//            Text("answer: \(questions[0].answer)")
//            QuestionView(question: questions[0])
//        ForEach(1..<numQuestions, id: \.self) { i in
//            QuestionView(question: questions[0])
//        }
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
