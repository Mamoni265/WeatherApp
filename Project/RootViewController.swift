//
//  ViewController.swift
//  Project
//
//  Created by Amar Roy on 5/14/16.
//  Copyright © 2016 Moitreyee. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class RootViewController: UIViewController,CLLocationManagerDelegate,WeatherModelDelegate {
    
  let clm = CLLocationManager()
    
    
        var city = "SanJose"
           var desc:String?
    let model = WeatherModel()
    
    @IBOutlet weak var city_name: UITextField!
   
    @IBAction func set_city(sender: AnyObject) {
        print("*****Button tapped")
       city_name.resignFirstResponder()
        self.city = city_name.text!
    
        print(self.city)
         self.model.getRainfallData(self.city)
    }
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var weather_desc: UILabel!
       
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var temperature: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clm.requestAlwaysAuthorization()
        self.model.delegate = self
        
        
         }
    func setWeather(weather: Weather) {
        
        print(">>>>>>>>in set weather func, weather:\(weather)")
        location.text = weather.cityName
        weather_desc.text = weather.description
        temperature.text = "Temp: \(weather.temp - 273)deg C"
       
        humidity.text = "Humidity \(weather.humidity)%"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
            }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
