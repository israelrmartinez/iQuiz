//
//  Question.swift
//  iQuiz
//
//  Created by stlp on 5/11/22.
//

import SwiftUI

struct Question: Identifiable {
    var id = UUID()
    var text: String
    var answer: String
    var options: [String]
    
    init(_ question: Dictionary<String, Any>) {
        self.text = question["text"] as! String
        self.answer = question["answer"] as! String
        self.options = question["answers"] as! [String]
    }
}
