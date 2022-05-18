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
//        self.img = "other"
        self.img = ""
        let quests = test["questions"] as! [Dictionary<String, Any>]
        self.questions = setQuiz(quests: quests)
        let quest = quests[0]
    }
    
    mutating func setQuiz(quests queries: [Dictionary<String, Any>]) -> [Question] {
        var questionHolder: [Question] = []
        for query in queries {
            let text = query["text"] as! String
            let quest = Question(query)
            
            questionHolder.append(Question(query))
        }
        self.img = findImage()
        return questionHolder
    }
    
    func findImage() -> String {
        var imgUrl = ""
        if self.title == "Science!" {
            imgUrl = "science"
        } else if self.title == "Marvel Super Heroes" {
            imgUrl = "marvel"
        } else if self.title == "Mathematics" {
            imgUrl = "math"
        } else {
            imgUrl = "other"
        }
        return imgUrl
    }
}
