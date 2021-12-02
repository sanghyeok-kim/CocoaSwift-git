//
//  ViewController.swift
//  Week5-WeatherApp
//
//  Created by 김상혁 on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var entireOutlets: [UILabel]!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var localTimeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherimageView: UIImageView!
    
    @IBAction func searchCityBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "도시 검색", message: nil, preferredStyle: .alert)
        let searchBtn = UIAlertAction(title: "검색", style: .default, handler: { _ in
            if let inputCityName = alert.textFields?[0].text {
                
                if inputCityName == "codesquad" {
                    self.codesquadEasterEgg()
                } else {
                    self.getCurrentWeather(cityName: inputCityName)
                }
            }
        })
        
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(searchBtn)
        alert.addAction(cancelBtn)
        alert.addTextField(configurationHandler: { cityTextField in
            cityTextField.placeholder = "도시 이름 입력"
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=00e5cc35400b63777035b875f27668da") else { return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else { return }
//            debugPrint(weatherInformation)
            
            DispatchQueue.main.async {
                self?.configureView(weatherInformation: weatherInformation)
//                self?.operateTimer(weatherInformation: weatherInformation)
            }
        }.resume()
    }
    
//    public func operateTimer(weatherInformation: WeatherInformation) {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            let localTime = Date().toStringUTC(weatherInformation.timezone)
//            let localTimeLabelText = localTime
//            self.localTimeLabel.text = localTimeLabelText
//            self.fadeInTextLabel(textLabel: self.localTimeLabel, delay: 0.75, text: localTimeLabelText)
//        }
//    }
    
    
    func configureView(weatherInformation: WeatherInformation) {
        
        guard let weather = weatherInformation.weather.first else { return }
        let weatherDescriptionText = weather.description

        let cityNameLabelText = weatherInformation.name
        let tempLabelText = "\(Int(weatherInformation.main.temp - 273.15))℃"
        let minTempLabelText = "↓ \(Int(weatherInformation.main.minTemp - 273.15))℃"
        let maxTempLabelText = "↑ \(Int(weatherInformation.main.maxTemp - 273.15))℃"
        
        fadeInTextLabel(textLabel: cityNameLabel, delay: 0.25, text: cityNameLabelText)
        fadeInTextLabel(textLabel: weatherDescription, delay: 0.75, text: weatherDescriptionText)
        fadeInTextLabel(textLabel: tempLabel, delay: 1.5, text: tempLabelText)
        fadeInTextLabel(textLabel: minTempLabel, delay: 2.0, text: minTempLabelText)
        fadeInTextLabel(textLabel: maxTempLabel, delay: 2.0, text: maxTempLabelText)
    
        displayWeatherImage(weather: weather)
        
        
        let localTime = Date().toStringUTC(weatherInformation.timezone)
        let localTimeLabelText = localTime
//        self.localTimeLabel.text = localTimeLabelText
        self.fadeInTextLabel(textLabel: self.localTimeLabel, delay: 0.75, text: localTimeLabelText)
        
        
    }
    

    func displayWeatherImage(weather: Weather) {
        switch weather.id {
        case 200..<300:
            guard let weatherImage = UIImage(named: "storm.png") else { return }
            fadeInImageView(image: weatherImage)
        case 300..<400:
            guard let weatherImage = UIImage(named: "raindrop.png") else { return }
            fadeInImageView(image: weatherImage)
        case 500..<600:
            guard let weatherImage = UIImage(named: "rain.png") else { return }
            fadeInImageView(image: weatherImage)
        case 600..<700:
            guard let weatherImage = UIImage(named: "snow.png") else { return }
            fadeInImageView(image: weatherImage)
        case 700..<762:
            guard let weatherImage = UIImage(named: "foggy.png") else { return }
            fadeInImageView(image: weatherImage)
        case 763..<800:
            guard let weatherImage = UIImage(named: "thunderstorm.png") else { return }
            fadeInImageView(image: weatherImage)
        case 800:
            guard let weatherImage = UIImage(named: "sun.png") else { return }
            fadeInImageView(image: weatherImage)
        case 800..<900:
            guard let weatherImage = UIImage(named: "cloud.png") else { return }
            fadeInImageView(image: weatherImage)
        default:
            return
        }
    }
    
    func fadeInTextLabel(textLabel: UILabel, delay: TimeInterval, text: String) {
        
        textLabel.alpha = 0
        textLabel.text = text
        UIView.animate(withDuration: 1.5, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textLabel.alpha = 1
        })
        
        for outlet in entireOutlets {
            outlet.isHidden = false
        }
    }
    
    func fadeInImageView(image: UIImage) {
        self.weatherimageView.image = image
        self.weatherimageView.alpha = 0
        UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseIn, animations: {
            self.weatherimageView.alpha = 1
        }, completion: nil)
    }
    
    func codesquadEasterEgg() {
        let cityNameLabelText = "CodeSquad"
        let weatherDescriptionText = "코딩중"
        let tempLabelText = "999℃"
        let minTempLabelText = "↓ 1024℃"
        let maxTempLabelText = "↑ 0℃"
        
        fadeInTextLabel(textLabel: cityNameLabel, delay: 0.25, text: cityNameLabelText)
        fadeInTextLabel(textLabel: weatherDescription, delay: 0.75, text: weatherDescriptionText)
        fadeInTextLabel(textLabel: tempLabel, delay: 1.5, text: tempLabelText)
        fadeInTextLabel(textLabel: minTempLabel, delay: 2.0, text: minTempLabelText)
        fadeInTextLabel(textLabel: maxTempLabel, delay: 2.0, text: maxTempLabelText)

        guard let weatherImage = UIImage(named: "codesquad-fire.png") else { return }
        fadeInImageView(image: weatherImage)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for outlet in entireOutlets {
            outlet.isHidden = true
        }
        self.getCurrentWeather(cityName: "seoul")
    }
}

