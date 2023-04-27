//
//  VideoClasses.swift
//  MyMotivation
//
//  Created by Stephen Glunt on 4/26/23.
//

import Foundation

struct keyBool: Identifiable {
    var id: String
    var value = false
}

class vidList: ObservableObject, Hashable {
    var title: String
    @Published var days = [
        keyBool(id: "Sunday", value: true),
        keyBool(id: "Monday", value: true),
        keyBool(id: "Tuesday", value: true),
        keyBool(id: "Wednesday", value: true),
        keyBool(id: "Thursday", value: true),
        keyBool(id: "Friday", value: true),
        keyBool(id: "Saturday", value: true)
    ]
    @Published var times = [
        keyBool(id: "Morning", value: true),
        keyBool(id: "Afternoon", value: true),
        keyBool(id: "Evening", value: true)
    ]
    var videos: [video]
    
    init(title: String, videos: [video]) {
        self.title = title
        self.videos = videos
    }
    
    static func == (lhs: vidList, rhs: vidList) -> Bool {
        return lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

class video {
    var vId: String
    var startTime: Int = 0
    var endTime: Int = 0
    var duration: Int {
        return endTime - startTime }
    
    init(vId: String, starTime: Int?, endTime: Int?){
        self.vId = vId
        if let start = starTime {
            self.startTime = start
        }
        if let end = endTime {
            self.endTime = end
        }
    }
    
    func getDuration() -> Int {
        var duration = 0
        let apiKey = "AIzaSyCuw6F3-br4Fholj4HDCJlSHGDuBEWRZWo"

        

        
        
        return duration
    }
    //    https://www.googleapis.com/youtube/v3/videos?id=9bZkp7q19f0&part=contentDetails&key=AIzaSyCuw6F3-br4Fholj4HDCJlSHGDuBEWRZWo
}
