//
//  WGLocationViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/22.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit
import CoreLocation

class WGLocationViewController: UIViewController {

    let localLab = UILabel(frame: CGRect(x: 0, y: 100, width: WgWith, height: 100))
    let findBtn = UIButton(frame: CGRect(x: 50, y: WgHeight-100, width: (WgWith-100), height: 50))
    
    // 强制自动解包，可以赋值为nil，为nil后再调用会报错
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的位置"
        self.view.backgroundColor = UIColor.cyan
        
        localLab.textColor = UIColor.black
        localLab.textAlignment = .center
        localLab.font = UIFont.systemFont(ofSize: 20)
        localLab.numberOfLines = 0
        localLab.backgroundColor = UIColor.yellow
        
        findBtn.setTitle("定位", for: .normal)
        findBtn.addTarget(self, action: #selector(findBtnClicked), for: .touchUpInside)
        findBtn.setTitleColor(UIColor.white, for: .normal)
        findBtn.setBackgroundImage(UIImage(named: "Find my location"), for: .normal)
        
        view.addSubview(localLab)
        view.addSubview(findBtn)
    }
    
    @objc func findBtnClicked() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension WGLocationViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        localLab.text = "Error while updating location " + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            
            guard error == nil else{
                
                self.localLab.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks!.first
                self.displayLocationInfo(pm)
            } else {
                self.localLab.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        
        if let containsPlacemark = placemark {
            
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            
            
            self.localLab.text = postalCode! + " " + locality!
            
            self.localLab.text?.append("\n" + administrativeArea! + ", " + country!)
            
            guard let addressDictionary = containsPlacemark.addressDictionary else{
                
                return
            }
            if let content = addressDictionary["FormattedAddressLines"] as? NSArray{
                
                if let str = content[0] as? String{
                    
                    self.localLab.text?.append("\n" + str)
                }
            }
        }
    }
}
