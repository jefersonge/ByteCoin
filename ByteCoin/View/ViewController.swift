//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: -  Variables
    var viewModel = ViewModel()
    var customView: ViewDelegate
    
    init( customView: ViewDelegate = View()) {
        self.customView = customView
        super .init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LoadView
    override func loadView() {
        view = customView
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.pickerView.dataSource = self
        customView.pickerView.delegate = self
        customView.pickerView.reloadAllComponents()
        
        viewModel.delegate = self
    }
}


//MARK: - PickerViewMethods
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return K.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return K.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = K.currencyArray[row]
        viewModel.getCoinPrice(for: selectedCurrency)
    }
}


//MARK: - ViewModelDelegate

extension ViewController: ViewModelDelegate{
    func updateCoin(coinModel: CoinModel) {
        let priceString = String(format: "%.1f", coinModel.price)
        customView.price.text = priceString
        customView.currency.text = coinModel.currency
    }
}
