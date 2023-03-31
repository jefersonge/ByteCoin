//
//  View.swift
//  ByteCoin
//
//  Created by Jeferson Dias dos Santos on 29/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit
//POP
protocol ViewDelegate where Self: UIView {
    var title: UILabel {get set}
    var imageByteCoin: UIImageView {get set}
    var price: UILabel {get set}
    var currency: UILabel {get set}
    var pickerView: UIPickerView {get set}
}


class View: UIView, ViewDelegate {
    
    //MARK: - Views
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = UIColor(named: "titleColor")
        title.text =  "ByteCoin"
        title.font = UIFont.systemFont(ofSize: 50)
        
        return title
    }()
    
    lazy var imageByteCoin: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "bitcoinsign.circle.fill")
        image.tintColor = UIColor(named: "iconColor")
        return image
    }()
    
    lazy var price: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .right
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 35)
        return title
    }()
    
    lazy var currency: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 35)
        return title
    }()
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    //MARK: - Init
    override init(frame: CGRect = .zero) {
        super .init(frame: frame)
        backgroundColor = UIColor(named: "backColor")
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AddSubviews
    func addSubviews(){
        addSubview(title)
        addSubview(imageByteCoin)
        addSubview(price)
        addSubview(currency)
        addSubview(pickerView)
    }
    
    
    //MARK: - SetConstraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageByteCoin.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageByteCoin.heightAnchor.constraint(equalToConstant: 80),
            imageByteCoin.widthAnchor.constraint(equalToConstant: 80),
            imageByteCoin.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            price.centerYAnchor.constraint(equalTo: imageByteCoin.centerYAnchor),
            price.leadingAnchor.constraint(equalTo: imageByteCoin.trailingAnchor),
            currency.centerYAnchor.constraint(equalTo: price.centerYAnchor),
            currency.widthAnchor.constraint(equalToConstant: 90),
            currency.leadingAnchor.constraint(equalTo: price.trailingAnchor, constant: 2),
            currency.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
