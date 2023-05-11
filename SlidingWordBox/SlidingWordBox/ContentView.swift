//
//  ContentView.swift
//  SlidingWordBox
//
//  Created by yohei on 2023/05/09.
//

import SwiftUI

struct ContentView: View {

    @State private var isAnimationActive = false

    @State  var isAnimating: Bool = false

    var body: some View {
        ZStack(alignment: .center) {
            Color(.gray)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
          
                Spacer()
                
                VStack {
                    SSSS_WordBox("Friend", isAnimating: $isAnimating
                    )
                    Spacer()
                        .frame(height: 20)
                    Button("Toggle") {
                        isAnimating = true
                    }
                }
                .background(.green)
                
                Spacer()
                
                Button("start") {
                    isAnimationActive.toggle()
                }
                
                Spacer()
                SSSS_WordBoxAnimationView(SlidingWordType.friend.text, isAnimationActive: $isAnimationActive)
                    .frame(maxWidth: .infinity)
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
