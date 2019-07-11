//
//  ViewShadow.swift
//  CoData
//
//  Created by B Masset on 11/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import UIKit

class ViewShadow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.075
    }
}
