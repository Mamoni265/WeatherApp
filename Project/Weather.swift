//
//  Weather.swift
//  Project
//
//  Created by Amar Roy on 5/15/16.
//  Copyright © 2016 Moitreyee. All rights reserved.
//

import Foundation

struct Weather {
    
    let cityName:String
    let description:String
    let temp:Int
    let maxTemp:Int
    let minTemp:Int
    let humidity:Int
    let rainfall:Int?
    
    init(city:String,desc:String,temp:Int,max:Int,min:Int,hum:Int,rain:Int?){
    
       self.cityName = city
        self.description = desc
        self.temp = temp
        self.maxTemp = max
        self.minTemp = min
        self.humidity = hum
        self.rainfall = rain
        
    
    }
    
    
}