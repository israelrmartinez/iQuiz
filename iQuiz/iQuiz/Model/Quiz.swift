//
//  Quiz.swift
//  iQuiz
//
//  Created by stlp on 5/10/22.
//

import SwiftUI


struct Quiz: Identifiable {
    var id = UUID()
    var title: String
    var desc: String
    var img: String
    var questions: [Question] = []
//    var answers: [String] = []
    
    init(quiz test: Dictionary<String, Any>) {
        self.title = test["title"] as! String
        self.desc = test["desc"] as! String
        self.img = "math"
        
        let quests = test["questions"] as! [Dictionary<String, Any>]
        print("quests: \(quests)")
//        print("array: \(quests)")
//        print("typeof: \(type(of: quests))")
        self.questions = setQuiz(quests: quests)
//        print("getQuestion: \(quests[0] )")
        let quest = quests[0]
        print("getQuestion: \(quest)")
//        self.questions = test["questions"] as! [Dictionary<String, Any>]
//        setTest()
    }
    
    func setQuiz(quests queries: [Dictionary<String, Any>]) -> [Question] {
        var questionHolder: [Question] = []
        print("queries: \(queries)")
        for query in queries {
            let text = query["text"] as! String
            print("query: \(text)")
            
            let quest = Question(query)
            print("obj.text: \(quest.text)")
            print("obj.answer: \(quest.answer)")
            print("obj.answers: \(quest.answers)")
            
            questionHolder.append(Question(query))
//            print("question: \(question.text)")
//            print("question: \(question.answers)")
//            questionHolder.append(Question(question))
        }
        print("questionHolder: \(questionHolder)")
        print("question: \(questionHolder[0].text)")
        return questionHolder
    }
}
