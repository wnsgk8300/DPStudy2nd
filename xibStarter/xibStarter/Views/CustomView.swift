////
////  CustomView.swift
////  xibStarter
////
////  Created by JEON JUNHA on 2022/12/12.
////
//
//import UIKit
//
//class CustomView: UIView {
//
//    static let identifier = String(describing: CustomView.self)
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        instantiateXib()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    private func instantiateXib() {
//        let nib = UINib(nibName: CustomView.identifier, bundle: nil)
//        guard let CustomView = nib.instantiate(withOwner: self).first as? CustomView else { return }
//        // 위의 두 줄이 아래 한 줄로 대체될 수 있음
//        //        guard let customVIew = Bundle.main.loadNibNamed(CustomView.identifier, owner: self)
//        CustomView.frame = frame
//        CustomView.backgroundColor = .clear
//        addSubview(CustomView)
//        backgroundColor = .yellow
//
//    }
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//
//}
//
//
//
