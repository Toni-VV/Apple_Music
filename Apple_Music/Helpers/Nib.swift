//
//  Nib.swift
//  Apple_Music
//
//  Created by Антон on 15.02.2021.
//

import UIKit

extension UIView{
    
    class func loadFromNib<T: UIView>() -> T{
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}