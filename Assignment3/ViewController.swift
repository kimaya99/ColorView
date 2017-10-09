//
//  ViewController.swift
//  Assignment3
//
//  Created by Kimaya Desai on 9/29/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    
    let RSlider = "RSlider"
    let GSlider = "GSlider"
    let BSlider = "BSlider"
    
    let RValue = "RValue"
    let GValue = "GValue"
    let BValue = "BValue"

    @IBAction func sliderSelect(_ sender: Any) {
       
        colorView.backgroundColor = UIColor(red:  CGFloat(redSlider.value), green:  CGFloat(greenSlider.value), blue:  CGFloat(blueSlider.value), alpha: 1.0)
        
        redValue.text = String(Int(redSlider.value * 100))
        greenValue.text = String(Int(greenSlider.value * 100))
        blueValue.text = String(Int(blueSlider.value * 100))
        
        UserDefaults.standard.set(CGFloat(redSlider.value), forKey: RSlider)
        UserDefaults.standard.set(CGFloat(greenSlider.value), forKey: GSlider)
        UserDefaults.standard.set(CGFloat(blueSlider.value), forKey: BSlider)
        
        UserDefaults.standard.set(redValue.text, forKey: RValue)
        UserDefaults.standard.set(blueValue.text, forKey: BValue)
        UserDefaults.standard.set(greenValue.text,forKey: GValue)
    }
    
    
    @IBAction func colorCalculate(_ sender: Any, forEvent event: UIEvent) {
       self.redValue.resignFirstResponder()
       self.greenValue.resignFirstResponder()
       self.blueValue.resignFirstResponder()
        
       if var redVal = Float(redValue.text!), var blueVal = Float(blueValue.text!), var greenVal = Float(greenValue.text!)
           {
            if redVal > 100.00 || blueVal > 100.0 || greenVal > 100.00
                {
                    let alert = UIAlertController(title: "Alert", message: "Input is Invalid", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                
                    if redVal > 100.00 {
                        redValue.text = String(100)
                        redVal = Float(redValue.text!)!
                    }
                
                    if blueVal > 100.00 {
                        blueValue.text = String(100)
                        blueVal = Float(blueValue.text!)!
                    }
                
                    if greenVal > 100.00 {
                        greenValue.text = String(100)
                        greenVal = Float(greenValue.text!)!
                    }
                }
            
            redSlider.value = (Float(redValue.text!)!/100.00)
            greenSlider.value = (Float(greenValue.text!)!/100.00)
            blueSlider.value = (Float(blueValue.text!)!/100.00)
            
            colorView.backgroundColor = UIColor(red:  CGFloat(redVal/100), green:  CGFloat(greenVal/100), blue:  CGFloat(blueVal/100), alpha: 1.0)
            
            UserDefaults.standard.set(CGFloat(redSlider.value), forKey: RSlider)
            UserDefaults.standard.set(CGFloat(greenSlider.value), forKey: GSlider)
            UserDefaults.standard.set(CGFloat(blueSlider.value), forKey: BSlider)
            
            UserDefaults.standard.set(redValue.text, forKey: RValue)
            UserDefaults.standard.set(blueValue.text, forKey: BValue)
            UserDefaults.standard.set(greenValue.text,forKey: GValue)
            
        }
       
        else  {
            let alert = UIAlertController(title: "Alert", message: "Enter all values", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
  
    override func viewDidLoad() {
       super.viewDidLoad()
        
        if let x = UserDefaults.standard.value(forKey: RSlider), let y = UserDefaults.standard.value(forKey: RValue) as? String {
            redSlider.value = x as! Float
             redValue.text = y
            }
        
        if let x = UserDefaults.standard.value(forKey: GSlider), let y = UserDefaults.standard.value(forKey: GValue) as? String {
            greenSlider.value = x as! Float
            greenValue.text = y
        }

        if let x = UserDefaults.standard.value(forKey: BSlider),let y = UserDefaults.standard.value(forKey: BValue) as? String{
            blueSlider.value = x as! Float
              blueValue.text = y
        }
        
        
       


       redValue.keyboardType = UIKeyboardType.numberPad
       blueValue.keyboardType = UIKeyboardType.numberPad
       greenValue.keyboardType = UIKeyboardType.numberPad
       sliderSelect(self)
       view.addSubview(colorView)
       setUpLayout()
    }
 
    private func setUpLayout(){
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        colorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
       
        
        

    }
    
}

