//
//  ContentView.swift
//  iQuizie
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var showingAlert = false
    @State var isActive: Bool = false
    @State private var results = [Result]()
    @State var posts: [Post] = []
    @State var quizzes: [Quiz] = []
    @State var arr: [Quiz] = []
    
//    @State var quizzes: [Quiz] = [
//        Quiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
//               "questions":[
//                 ["text":"Who is Iron Man?",
//                   "answer":"1",
//                   "answers":[
//                     "Tony Stark",
//                     "Obadiah Stane",
//                     "A rock hit by Megadeth",
//                     "Nobody knows"]
//                 ],
//                 ["text":"Who founded the X-Men?",
//                   "answer":"2",
//                   "answers":[
//                     "Tony Stark",
//                     "Professor X",
//                     "The X-Institute",
//                     "Erik Lensherr"]
//                 ],
//                 ["text":"How did Spider-Man get his powers?",
//                   "answer":"1",
//                   "answers":[
//                     "He was bitten by a radioactive spider",
//                     "He ate a radioactive spider",
//                     "He is a radioactive spider",
//                     "He looked at a radioactive spider"]
//                 ]
//               ]
//         ])
//    ]
    
//    var xQuizzes = [
//        XQuiz()
//    ]
    
    var body: some View {
        NavigationView {
            QuizList(setQuizzes: $quizzes)
            .navigationTitle("iQuiz")
            .onAppear {
                loadData()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Settings") {
                        showingAlert = true
                    }
                    Spacer()
                }
            }
            .padding()
            .alert("Settings go here", isPresented: $showingAlert, actions: {})
        }
//        .task {
//            await loadData()
//        }
    }
    
    @ViewBuilder
    var quizListView: some View {
        
        AnyView(Text(""))
    }
    
    func loadData() {
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")
        let session = URLSession.shared.dataTask(with: url!) {
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
//                print("questions: \(getQuizzes)")
                itemsDownloaded(items: getQuizzes as? NSArray)
            }
            catch {
                print("Something went boom")
            }
        }
        session.resume()
    }
    
    func itemsDownloaded(items: NSArray!) {
//        let quzzes = items as! NSArray as! [Quiz]
//        quzzes.forEach {_ in
//            print("the quizzes")
//            print(quzzes[0])}
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
//                var oneQuestions = test["questions"] as! [Dictionary<String, Any>]
//                let oneOptions: [String] = []
                
//                emptyDict["title"] = oneTitle
//                emptyDict["desc"] = oneDesc
//                emptyDict["questions"] = oneQuestions
                print("loop quiz: \(oneTitle)")
                print("loop desc: \(oneDesc)")
                
//                var quests: [Dictionary<String, Any>] = []
//                for ques in oneQuestions {
//                    var setQuests: Dictionary<String, Any> = [:]
//
//                    let oneText = ques["text"] as! String? ?? ""
//                    let oneAnswr = ques["answer"] as! String? ?? ""
//                    let oneAnswrs = ques["answers"] as? [String] ?? []
//
//                    setQuests["text"] = oneText
//                    setQuests["answer"] = oneAnswr
//                    var answrHolder: [String] = []
//
//                    print("a question: \(oneText)")
//                    print("correct answer: \(oneAnswr)")
//
//                    for answr in oneAnswrs {
//                        print("an option: \(answr)")
//                        answrHolder.append(answr)
//                    }
//                    setQuests["answers"] = answrHolder
//                    quests.append(setQuests)
//                }
                let oneQuiz = Quiz(quiz: oneTest)
                downloaded.append(oneQuiz)
//                print("this: \(oneTest)")
            }
            quizzes = downloaded
        } else {
            print("nothing found")
        }
    }
}

let id = Quiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
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
                ])

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
