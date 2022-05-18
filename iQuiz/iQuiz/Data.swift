//
//  Data.swift
//  iQuiz
//
//  Created by stlp on 5/17/22.
//

import SwiftUI

struct Data: Codable, Identifiable {
    let id: Int
    var title: String
    var desc: String
    var questions: [Question]
}

class FetchData: ObservableObject {
//    @Binding var quizzes: [Quiz]
    @Published var quizzes = [Quiz]()
//    @Published var quizzes: [Quiz] = []
    
    init() {
//        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")!
//        // 2.
//        URLSession.shared.dataTask(with: url) {(data, response, error) in
//            do {
//                if let quizData = data {
//                    // 3.
//                    let decodedData = try JSONDecoder().decode([Quiz].self, from: quizData)
//                    DispatchQueue.main.async {
//                        self.quizzes = decodedData
//                        print(self.quizzes)
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print("Error")
//            }
//        }.resume()
        loadData()
    }
    
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
                    print("loop quest title: \(String(describing: quest["title"]))")
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
