//
//  SideMenuView.swift
//  rnd-main-modular
//
//  Created by Arie May Wibowo on 18/03/21.
//

import UIKit

class SideMenuView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
}
