//
//  MapKitViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/26.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {
    
    private let mapView = MKMapView()
    private let button = UIButton()
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        setUI()
        //annotation image 바꿀거임
        mapView.delegate = self
        locationManager.delegate = self
        // 위치 정확도 - 배터리에 영향
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 지속적으로 업데이트
        locationManager.startUpdatingLocation()
        requestLocationAuthorization()
        fetchocationsOnMap(locations: Stadium.stadiums)
    }
    @objc
    func didTapButton(_ sender: UIButton) {
        centerLocation(location: Stadium.stadiums.last!)
    }
}

extension MapKitViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        centerUserLocation(locations: locations)
        print(locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocationAuthorization()
    }
    // 방향 업데이트 확인
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading)
    }
}

extension MapKitViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // UserLoaction은 덮어씌우지 않겠다
        guard !(annotation is MKUserLocation) else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "poketball")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "poketball")
            //annotation 선택시 이름 뜨게
            annotationView?.canShowCallout = true
            // annotation이 뭉쳐았으면 줌아웃떄 합쳐짐
            annotationView?.clusteringIdentifier = "stadium"
            // annotation합쳐질때 가장 늦게 합쳐질거 선택
            annotationView?.displayPriority = .required
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "poketball")
        annotationView?.frame.size = CGSize(width: 40, height: 40)
        
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
    }
}

extension MapKitViewController {
    private func requestLocationAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
            mapView.showsUserLocation = true
            
            //유저 따라다니기
//            mapView.userTrackingMode = .follow
            // 새로운 케이스 추가시 자동으로 여기에 추가됨
        @unknown default:
            break
        }
    }
    // 맵뷰 시작시 현재 위치를 center로
    private func centerUserLocation(locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func fetchocationsOnMap(locations: [LocationRepresentable]) {
        for stadium in locations {
            // pin 이름
            let annotation = MKPointAnnotation()
            annotation.title = stadium.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: stadium.latitude, longitude: stadium.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    private func centerLocation(location: LocationRepresentable) {
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}

// MARK: - UI
extension MapKitViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    final private func setLayout() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.width.height.equalTo(50)
        }
    }
    
}
