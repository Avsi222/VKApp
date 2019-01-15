//
//  Session.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01.11.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//


import Foundation

class Session {
    private init() { }
    
    public static let shared = Session()
    
    var token = ""
    var userId = 0
}

