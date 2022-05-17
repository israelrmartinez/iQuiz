//
//  ResultsView.swift
//  iQuiz
//
//  Created by stlp on 5/12/22.
//

import SwiftUI

struct ResultsView: View {
    @ObservedObject var userModel: UserModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(userModel: UserModel())
    }
}
