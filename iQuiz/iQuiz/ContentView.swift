//
//  ContentView.swift
//  iQuizie
//
//  Created by stlp on 5/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State var isActive: Bool = false
    @State var quizzes: [Quiz] = []
    @ObservedObject var fetch = FetchData()
    
    var body: some View {
        NavigationView {
            List(fetch.quizzes) {
                quiz in ListRow(oneQuiz: quiz)
            }
            .navigationTitle("iQuiz")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Settings") {
//                        showingAlert = true
//                    }
                    NavigationLink("Settings", destination: SettingsView())
                    Spacer()
                }
//            QuizList(setQuizzes: quizzes)
//            .navigationTitle("iQuiz")
//            .onAppear {
//                loadData()
            }
//            }
//            .padding()
//            .alert("Settings go here", isPresented: $showingAlert, actions: {})
        }
    }
    
//    @ViewBuilder
//    var quizListView: some View {
//
//        AnyView(Text(""))
//    }
    
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
                itemsDownloaded(items: getQuizzes as? NSArray)
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
                
                print("loop quiz: \(oneTitle)")
                print("loop desc: \(oneDesc)")
                
                let oneQuiz = Quiz(quiz: oneTest)
                downloaded.append(oneQuiz)
            }
            quizzes = downloaded
        } else {
            print("nothing found")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
