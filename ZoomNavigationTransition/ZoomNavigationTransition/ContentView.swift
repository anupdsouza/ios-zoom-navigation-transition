//
//  ContentView.swift
//  ZoomNavigationTransition
//
//  Created by Anup D'Souza on 12/06/24.
//  🕸️ https://www.anupdsouza.com
//  🔗 https://twitter.com/swift_odyssey
//  👨🏻‍💻 https://github.com/anupdsouza
//  ☕️ https://www.buymeacoffee.com/anupdsouza
//

import SwiftUI

struct ContentView: View {
    @Namespace private var namespace
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                detailView
                    .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
            } label: {
                Image("bond-circle")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .matchedTransitionSource(id: "zoom", in: namespace)
            }

        }
        .tint(.white)
    }
    
    private var detailView: some View {
        GeometryReader { proxy in
            Image("bond-gunbarrel")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .overlay(alignment: .bottom) {
                    Text("James Bond")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.bottom, 50)
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
