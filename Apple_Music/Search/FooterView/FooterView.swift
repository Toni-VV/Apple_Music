//
//  FooterView.swift
//  Apple_Music
//
//  Created by Антон on 14.02.2021.
//

import UIKit

class FooterView: UIView{
    
    private var label: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: 14)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = #colorLiteral(red: 0.631372549, green: 0.6470588235, blue: 0.662745098, alpha: 1)
        return l
    }()
    
    private var loader: UIActivityIndicatorView = {
        let a = UIActivityIndicatorView()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.hidesWhenStopped = true
        return a
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupElements(){
        addSubview(loader)
        addSubview(label)
        
        loader.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        loader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        loader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: loader.bottomAnchor, constant: 8).isActive = true
        
    }
    
    func showLoader(){
        loader.startAnimating()
        label.text = "Loading"
    }
    
    func hideLoader(){
        loader.stopAnimating()
        label.text = ""
    }
    
}
