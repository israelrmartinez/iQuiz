//
//  Data.swift
//  iQuiz
//
//  Created by stlp on 5/17/22.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id: Int
    var title: String
    var desc: String
    var questions: [Question]
}

class Api {
//    func getPosts() {
//        let url = URL(string: "http://tednewardsandbox.site44.com/questions.json")
//        let session = URLSession.shared.dataTask(with: url!) {
//            data, response, error in
//            
//            
//            if response != nil {
//                if (response! as! HTTPURLResponse).statusCode != 200 {
//                    print("Something went wrong! \(String(describing: error))")
//                }
//            }
//            
//            ___ = response! as! HTTPURLResponse
//            
//            print(data)
//            
//            do {
//                let questions = try JSONSerialization.jsonObject(with: data!)
//                print(questions)
//            }
//            catch {
//                print("Something went boom")
//            }
//        }
//        session.resume()
//
//    }
}
