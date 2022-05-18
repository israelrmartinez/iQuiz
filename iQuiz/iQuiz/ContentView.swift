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
    
    @State var quizzes: [Quiz] = [
        Quiz(quiz: [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
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
    ]
    
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
            
            print(data ?? [{}])
            
            do {
                let questions = try JSONSerialization.jsonObject(with: data!)
                print(questions)
            }
            catch {
                print("Something went boom")
            }
        }
        session.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
