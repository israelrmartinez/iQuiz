//
//  Data.swift
//  iQuiz
//
//  Created by stlp on 5/17/22.
//

import SwiftUI

struct QuizModel: Codable, Identifiable {
    let id: Int
    var title: String
    var desc: String
    var questions: [Question]
}

class ApiModel: ObservableObject {
//    @Binding var quizzes: [Quiz]
//    @Binding var quizzes: [Quiz]
    @Published var quizzes: [Quiz] = []
    
    func loadData() {
        self.quizzes = []
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")
        let session = URLSession.shared.dataTask(with: url!) { [weak self]
            data, response, error in
            
            
            if response != nil {
                if (response! as! HTTPURLResponse).statusCode != 200 {
                    print("Something went wrong! \(String(describing: error))")
                }
            }
            
            let httpResponse = response! as! HTTPURLResponse
            
            print("data: ", data ?? [[]], "the data")
            
            do {
                let getQuizzes = try JSONSerialization.jsonObject(with: data!)
                self?.itemsDownloaded(items: getQuizzes as? NSArray)
                print("items downloaded")
            }
            catch {
                print("Something went boom")
            }
        }
        session.resume()
    }
    
    func itemsDownloaded(items: NSArray!) {
        var downloaded: [Quiz] = []
        if let tests = items as? [Dictionary<String, Any>] {
            var emptyQuizArr: [Dictionary<String, Any>] = []
            
            print(items ?? [])
            print("type: \(type(of: tests))")
            print("count: \(tests.count)")
            print("all test: \(tests)")
            
            for test in tests {
                let oneTest = test
                let oneTitle = test["title"] as! String? ?? ""
                let oneDesc = test["desc"] as! String? ?? ""
                let oneTestQuiz = test["questions"] as! [Dictionary<String, Any>]
                
                print("loop title: \(oneTitle)")
                print("loop desc: \(oneDesc)")
                for quest in oneTestQuiz {
                    print("loop quest title: \(quest["title"])")
                }
                
                let oneQuiz = Quiz(quiz: oneTest)
                downloaded.append(oneQuiz)
            }
            self.quizzes = downloaded
            print("all quizzes: \(self.quizzes)")
            print("type: \(type(of: self.quizzes))")
        } else {
            print("nothing found")
        }
    }
}
