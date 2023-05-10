//
//  ContentView.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import SwiftUI

struct ContentView: View {

    @State private var isAnimationActive = false


    var body: some View {
        ZStack(alignment: .center) {
            Color(.gray)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Button("start") {
                    isAnimationActive.toggle()
                }
                Spacer()
                SSSS_WordBoxAnimationView(SlidingWordType.friend.text, isAnimationActive: $isAnimationActive)
            }
                .padding()
    


        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
