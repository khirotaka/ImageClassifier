//
//  ContentView.swift
//  ImageClassifier
//
//  Created by 川島 寛隆 on 2019/10/10.
//  Copyright © 2019 川島 寛隆. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var isPushed: Bool = false
    var body: some View {
        VStack {
            if self.isPushed {
                ImageOpen()
            } else {
                VStack {
                    StartView()
                    Button(action: {
                        self.isPushed = true
                    }) {
                        Text(" > ")
                            .font(.title)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }.frame(width: 640, height: 480, alignment: .center)
    }
}


struct StartView: View {
    var body: some View {
        VStack {
            Text("Welcome!")
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
