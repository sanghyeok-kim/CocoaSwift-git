//
//  ViewController.swift
//  Week5-WeatherApp
//
//  Created by 김상혁 on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!

    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
    @IBAction func tapFetchWeatherBtn(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true) //버튼이 눌리면 키보드 사라짐
        }
    }
    
    func configureView(weatherInformation: WeatherInformation) {
        self.cityNameLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first {
            self.weatherDescription.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInformation.main.temp - 273.15))℃"
        self.minTempLabel.text = "최저: \(Int(weatherInformation.main.minTemp - 273.15))℃"
        self.maxTempLabel.text = "최고: \(Int(weatherInformation.main.maxTemp - 273.15))℃"
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&lang=kr&appid=00e5cc35400b63777035b875f27668da") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else { return }
//            debugPrint(weatherInformation)
            
            DispatchQueue.main.async {
                self?.weatherStackView.isHidden = false
                self?.configureView(weatherInformation: weatherInformation)
            }
        }.resume()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

