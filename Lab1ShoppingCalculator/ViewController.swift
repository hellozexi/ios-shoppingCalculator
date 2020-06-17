//
//  ViewController.swift
//  Lab1ShoppingCalculator
//
//  Created by Mike Liu on 6/16/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FinalPrice: UILabel!
    @IBOutlet weak var OriginalPrice: UITextField!
    @IBOutlet weak var Discount: UITextField!
    @IBOutlet weak var SalesTax: UITextField!
    
    var originalPrice = "0";
    var discount = "0";
    var salesTax = "0";
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func InputPrice(_ sender: Any) {
        update()
    }
    
    @IBAction func InputDiscount(_ sender: Any) {
        update()
    }
    
    @IBAction func InputTax(_ sender: Any) {
        update()
    }
    
    @IBAction func getChicagoSalesTax(_ sender: Any) {
        SalesTax.text = "10.250"
        update()
    }
    @IBAction func getStLouisTax(_ sender: Any) {
        SalesTax.text = "9.679"
        update()
    }
    
    @IBAction func getNewYorkSalesTax(_ sender: Any) {
        SalesTax.text = "8.875"
        update()
    }
    @IBAction func getLASalesTax(_ sender: Any) {
        SalesTax.text = "9.500"
        update()
    }
    @IBAction func getRaleighSalesTax(_ sender: Any) {
        SalesTax.text = "7.250"
        update()
    }
    @IBAction func getSeattleSalesTax(_ sender: Any) {
        SalesTax.text = "10.100"
        update()
    }
    func update() {
        
        originalPrice = OriginalPrice.text!
        let originalPriceVal = OriginalPrice.text != "" ? Double(originalPrice) : 0.0
        discount = Discount.text!
        let discountVal = Discount.text != "" ? Double(discount) : 0.0
        salesTax = SalesTax.text!
        let salesTaxVal = SalesTax.text != "" ? Double(salesTax) : 0.0
        if((originalPriceVal != nil && originalPriceVal! < 0.0) || (discountVal != nil && (discountVal! < 0.0 || discountVal! > 100.0)) || (salesTaxVal != nil && (salesTaxVal! < 0.0 || salesTaxVal! > 100.0))) {
            FinalPrice.text = "$0.0"
            return
        }
        if(originalPriceVal != nil && discountVal != nil && salesTaxVal != nil) {
            let finalResult = (1 - discountVal! / 100) * (1 + salesTaxVal! / 100) * originalPriceVal!
            let resultText = "$\(String(format: "%.2f", finalResult))"
            FinalPrice.text = resultText
        } else {
            FinalPrice.text = "$0.0"
        }
        
    }
}

