//
//  Quiz.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import UIKit

class Quzzies: NSObject {
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
