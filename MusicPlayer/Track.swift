//
//  Track.swift
//  MusicPlayer
//
//  Created by Jameson Quave on 9/16/14.
//  Copyright (c) 2014 JQ Software LLC. All rights reserved.
//

import Foundation

class Track {
    
    var title: String
    var price: String
    var previewUrl: String
    var tracks = [Track]()
    
    init(title: String, price: String, previewUrl: String) {
        self.title = title
        self.price = price
        self.previewUrl = previewUrl
    }
    
    class func tracksWithJSON(allResults: NSArray) -> [Track] {
        
        var tracks = [Track]()
        
        if allResults.count>0 {
            for trackInfo in allResults {
                // Create the track
                if let kind = trackInfo["kind"] as? String {
                    if kind=="song" {
                        
                        var trackPrice = trackInfo["trackPrice"] as? Double
                        var trackTitle = trackInfo["trackName"] as? String
                        var trackPreviewUrl = trackInfo["previewUrl"] as? String
                        
                        if(trackTitle == nil) {
                            trackTitle = "Unknown"
                        }
                        if(trackPrice == nil) {
                            trackPrice = 0.0
                        }
                        if(trackPreviewUrl == nil) {
                            trackPreviewUrl = ""
                        }
                        
                        let strTrackPrice = NSString(format: "%.2f", trackPrice!) as String
                        
                        var track = Track(title: trackTitle!, price: strTrackPrice, previewUrl: trackPreviewUrl!)
                        tracks.append(track)
                        
                    }
                }
            }
        }
        return tracks
    }
    
}