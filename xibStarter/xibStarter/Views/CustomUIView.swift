//
//  CustomUIView.swift
//  xibStarter
//
//  Created by JEON JUNHA on 2022/12/19.
//

import UIKit

class CustomUIView: UIView {
    
    static let identifier = String(describing: CustomUIView.self)

    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiateXib()
        
    }
    
    private func instantiateXib() {
        let nib = UINib(nibName: CustomUIView.identifier, bundle: nil)
        guard let viewFromXib = nib.instantiate(withOwner: self).first as? UIView else { fatalError() }
        addSubview(viewFromXib)
        viewFromXib.frame = bounds
        backgroundColor = .red
    }
}
