//
//  ViewController.swift
//  Week5-WeatherApp
//
//  Created by 김상혁 on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var weatherimageView: UIImageView!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
    @IBAction func searchCityBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "도시 검색", message: nil, preferredStyle: .alert)
        let searchBtn = UIAlertAction(title: "검색", style: .default, handler: { _ in
            if let inputCityName = alert.textFields?[0].text {
                
                if inputCityName == "codesquad" {
                    self.codesquadEasterEgg()
                } else {
                self.getCurrentWeather(cityName: inputCityName)
                }
//                self.view.endEditing(true) //버튼이 눌리면 키보드 사라짐
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
    
    func configureView(weatherInformation: WeatherInformation) {
        self.cityNameLabel.text = weatherInformation.name
        
        guard let weather = weatherInformation.weather.first else { return }
        self.weatherDescription.text = weather.description
        
        self.tempLabel.text = "\(Int(weatherInformation.main.temp - 273.15))℃"
        self.minTempLabel.text = "↓ \(Int(weatherInformation.main.minTemp - 273.15))℃"
        self.maxTempLabel.text = "↑ \(Int(weatherInformation.main.maxTemp - 273.15))℃"
        
        fadeInTextLabel(textLabel: cityNameLabel, delay: 0.25)
        fadeInTextLabel(textLabel: weatherDescription, delay: 0.75)
        fadeInTextLabel(textLabel: tempLabel, delay: 1.5)
        fadeInTextLabel(textLabel: minTempLabel, delay: 2.0)
        fadeInTextLabel(textLabel: maxTempLabel, delay: 2.0)
        
        displayWeatherImage(weather: weather)
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
                self?.weatherStackView.isHidden = false
                self?.configureView(weatherInformation: weatherInformation)
            }
        }.resume()
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
    
    func fadeInTextLabel(textLabel: UILabel, delay: TimeInterval) {
        textLabel.alpha = 0
        UIView.animate(withDuration: 1.5, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textLabel.alpha = 1
        })
    }
    
    func fadeInImageView(image: UIImage) {
        self.weatherimageView.image = image
        self.weatherimageView.alpha = 0
        UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseIn, animations: {
            self.weatherimageView.alpha = 1
        }, completion: nil)
    }
    
    func codesquadEasterEgg() {
        self.cityNameLabel.text = "CodeSquad"
        self.weatherDescription.text = "코딩중"
        self.tempLabel.text = "999℃"
        self.minTempLabel.text = "↑ 1024℃"
        self.maxTempLabel.text = "↓ 0℃"
        
        fadeInTextLabel(textLabel: cityNameLabel, delay: 0.25)
        fadeInTextLabel(textLabel: weatherDescription, delay: 0.75)
        fadeInTextLabel(textLabel: tempLabel, delay: 1.5)
        fadeInTextLabel(textLabel: minTempLabel, delay: 2.0)
        fadeInTextLabel(textLabel: maxTempLabel, delay: 2.0)

        guard let weatherImage = UIImage(named: "codesquad-fire.png") else { return }
        fadeInImageView(image: weatherImage)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCurrentWeather(cityName: "seoul")
        // Do any additional setup after loading the view.
    }
}

