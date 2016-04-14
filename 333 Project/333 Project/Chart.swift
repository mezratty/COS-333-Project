//
//  Chart.swift
//
//
//  Created by Divya Mehta on 4/7/16.
//
//
import Foundation

class Chart {
    let date: String
    let team: String
    let location: String
    let time: String
    
    required init(date: String, team: String, location: String, time: String) {
        self.date = date
        self.team = team
        self.location = location
        self.time = time
    }
}
