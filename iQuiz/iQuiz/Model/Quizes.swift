//
//  Quiz.swift
//  iQuiz
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct Quizes: Identifiable {
    var id = UUID()
    var title: String
    var img: String
    var desc: String!
    
    init(quizName name: String, quizImage image: String) {
        self.title = name
        self.img = image
        self.desc = "A \(name) quiz."
    }
}


struct Quiz: Identifiable {
    var id = UUID()
    var title: String
    var desc: String
    var img: String
    var questions: Dictionary<String, String>
    var answers: [String] = []
    
    init(quiz test: Dictionary<String, Any>) {
        self.title = test["title"] as! String
        self.desc = test["desc"] as! String
        self.questions = test["questions"] as! Dictionary<String, String>
        self.img = "math"
        print("key: \(test["title"] as! String)")
        setTest()
    }
    
    func setTest() {
        var questionHolder: Array<Dictionary<String, Any>>
        for question in questions {
            print("questions \(question.value)")
        }
    }
}
