//
//  WeatherModel.swift
//  Project
//
//  Created by Amar Roy on 5/15/16.
//  Copyright © 2016 Moitreyee. All rights reserved.
//

import Foundation

protocol WeatherModelDelegate {
    
    func setWeather(weather:Weather)
}

class WeatherModel{
    
    var delegate:WeatherModelDelegate?
   
    
func getRainfallData(city:String){
    
   
    
    let path = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=432bc7c8f7003c77a2d137120a29eb10"
    let url = NSURL(string: path)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) in
        let json = JSON(data: data!)
        let cityName = json["name"].string
        let description = json["weather"][0]["description"].string
        let temperature = json["main"]["temp"].int
        let maxTemp = json["main"]["temp_max"].int
        let minTemp = json["main"]["temp_min"].int
        let humidity = json["main"]["humidity"].int
        let rain = json["rain"]["3h"].int
        
        
        
        let weather = Weather(city: cityName! , desc: description! , temp: temperature!, max: maxTemp!, min: minTemp!, hum: humidity!, rain: rain)
        if self.delegate != nil
        {
            dispatch_async(dispatch_get_main_queue(), {
                
                self.delegate?.setWeather(weather)

            })
            
        }
    }
    
    task.resume()
    
    
}

}
