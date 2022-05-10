//
//  Quiz.swift
//  iQuiz
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct Quiz: Identifiable {
    var id: Int
    
    var title: String
    var img: String
    var desc: String!
    
    init(quizID id: Int, quizName name: String, quizImage image: String) {
        self.id = id
        self.title = name
        self.img = image
        self.desc = "A \(name) quiz."
    }
}
