//
//  SettingsView.swift
//  iQuiz
//
//  Created by stlp on 5/17/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Download json from site")) {
                    Button("Check now", action: {downloadJSON()})
                }
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func downloadJSON() {
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
