//
//  ContentView.swift
//  MyMotivation
//
//  Created by Stephen Glunt on 4/26/23.
//

import SwiftUI

struct ContentView: View {
    
    private var morningPlaylist: vidList = vidList(title: "Morning List", videos: [
        video.init(vId: "OykDjqQqudY", starTime: 45, endTime: 472),
        video.init(vId: "jj2AAH6jbHk", starTime: 33, endTime: 840)
    ])
    
    private var shortStretches: vidList = vidList(title: "Stretches", videos: [
        video.init(vId: "Pjf9sYIpTW4", starTime: 58, endTime: 358),
        video.init(vId: "cacwri2wio4", starTime: 10, endTime: 387),
        video.init(vId: "whf9pRHbH0o", starTime: 12, endTime: 323),
        video.init(vId: "NVzs5gy11wQ", starTime: 144, endTime: 492),
        video.init(vId: "NVzs5gy11wQ", starTime: 144, endTime: 492)
    ])
    
    private var eveningYoga: vidList = vidList(title: "Yoga", videos: [
        video.init(vId: "ZSSC9X_6wo4", starTime: 110, endTime: 1459),
        video.init(vId: "6F0l9lVnKdQ", starTime: 55, endTime: 1214)
    ])
    
    private var chest: vidList = vidList(title: "Chest", videos: [
        video.init(vId: "qwx1VV9vV1A", starTime: 25, endTime: 805),
        video.init(vId: "z69-sHjnPd0", starTime: 126, endTime: 650),
        video.init(vId: "JLRxJDe8UMY", starTime: 32, endTime: 332),
        video.init(vId: "rxEMKXW2Wqs", starTime: 105, endTime: 690)
    ])
    
    
    var body: some View {
        NavigationView {
            ZStack{
                ChangingGradient()

                VStack {
                    NavigationLink(destination: PlayView(playList: morningPlaylist)) {
                        Text(morningPlaylist.title)
                            .buttonStyle()
                    }
                    .padding()
                    NavigationLink(destination: PlayView(playList: shortStretches)) {
                        Text(shortStretches.title)
                            .buttonStyle()
                    }
                    .padding()
                    NavigationLink(destination: PlayView(playList: chest)) {
                        Text(chest.title)
                            .buttonStyle()
                    }
                    .padding()
                    NavigationLink(destination: PlayView(playList: eveningYoga)) {
                        Text(eveningYoga.title)
                            .buttonStyle()
                    }
                    .padding()
                }
            }
        }
    }
}

struct ButtonLink: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 10.0, maxWidth: 200.0)
            .background(Color.black.opacity(0.5))
            .cornerRadius(15)
            .shadow(radius: 15)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonLink())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
