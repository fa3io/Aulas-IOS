//
//  RoundButton.swift
//  helloword
//
//  Created by Aloc SP08609 on 21/11/2017.
//  Copyright © 2017 Aloc SP08609. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    

}
