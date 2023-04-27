//
//  PlayView.swift
//  MyMotivation
//
//  Created by Stephen Glunt on 4/26/23.
//

import SwiftUI
import WebKit
var myVideo = video.init(vId: "i27K2ry9jEo", starTime: 14, endTime: 603)


struct PlayView: View {
    @State private var vidIndex = 0
    let playList: vidList
    var body: some View {
        ZStack {
            ChangingGradient()
            //https://www.youtube.com/watch?v=OykDjqQqudY
            VStack {
                VideoView(currentVid: playList.videos[vidIndex])
                    .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.6)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                Button("Next Video") {
                    vidIndex += 1
                    if(vidIndex == playList.videos.count){
                        vidIndex = 0
                    }
                }
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding()
            }
        }
    }
}

struct VideoView: UIViewRepresentable {
    let currentVid: video
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(currentVid.vId)?start=\(currentVid.startTime)&end=\(currentVid.endTime)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct PlayView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayView(playList: vidList(title: "test", videos: [myVideo]))
    }
}
