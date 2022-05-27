//
//  ViewController.swift
//  TESTHTML
//
//  Created by Salma Hassan on 13/04/2022.
//

import UIKit


public class ThermometerClass {
  private(set) var temperature: Double = 0.0
  public func registerTemperature(_ temperature: Double) {
	self.temperature = temperature
  }
}



public struct ThermometerStruct {
  private(set) var temperature: Double = 0.0
  public mutating func registerTemperature(_ temperature: Double) {
	self.temperature = temperature
  }
}



class ViewController: UIViewController {

	@IBOutlet weak var textVieww: UITextView!
	
	public private(set) var testProperty: String = "salma"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		textVieww.attributedText = "Si tu banco no tiene sede en España confirma que tiene activo el pago recurrente en tu tarjeta. <br><div style='padding-top: 10px;'><a id='smartpayAlertBanks' href='https://www.vodafone.es/c/statics/Listado_Bancos_KO.pdf' target='_blank' style='text-decoration: underline !important; color: #333333'>Ver bancos afectados</a></div>"
			.convertToHtml3()
		
		let thermometerClass = ThermometerClass()
		thermometerClass.registerTemperature(56.0)
		
		var thermometerStruct = ThermometerStruct()
		thermometerStruct.registerTemperature(56.0)
		print("salma")
		
		
//		let queue = DispatchQueue(label: "serialQueueTest")
//
////		queue.sync {
////			print("Task 1 started")
////			print("Task 1 ended")
////		}
////
////		queue.sync {
////			print("Task 2 started")
////			print("Task 2 ended")
////		}
//
//		queue.async {
//			print(1)
//
//			queue.sync {
//				print(2)
//
//				queue.async {
//					print(3)
//				}
//			}
//		}
//
//		queue.async {
//			print(4)
//		}
//
//		queue.async {
//			print(5)
//		}
		
		
		var number = 1234
		number.isBalancedNumber()
		
	}
	@IBAction func buttonAction(_ sender: Any) {
//		let phoneNumber = number.replacingOccurrences(of: " ", with: "")
		if let url = URL(string: "tel://13321"), UIApplication.shared.canOpenURL(url) {
			if #available(iOS 10, *) {
				UIApplication.shared.open(url)
			} else {
				UIApplication.shared.openURL(url)
			}
		}
	}
	
}

extension Int {
	@discardableResult
	mutating func isBalancedNumber() -> Bool {
		let arrayOfDigits = digits()
		let result = arrayOfDigits.enumerated().reduce((evens: 0, odds: 0)) {
			if $1.offset % 2 == 0 {
				return ($0.evens + $1.element, $0.odds)
			} else {
				return ($0.evens, $0.odds + $1.element)
			}
		}
		print(result)
		return result.odds == result.evens
		
	}
	
	mutating func digits() -> [Int] {
		var digitsArray = [Int]()
		while self != 0 {
			digitsArray.append(self % 10)
			self /= 10
		}
		return digitsArray.reversed()
	}
	
}


enum CasesAgain {
	case one , two , three
	
	var name: String {
		switch self {
		case .one:
			return ""
			
		default:
			return "S"
		}
	}
}

enum Cases {
	case one , two , three
	
	var name: String {
		switch self {
		case .one:
			return ""
			
		default:
			return "S"
		}
	}
}

class OtherClass {
	let viewController = ViewController()
	
	// test violation
}

extension String {
	
	func styleHtmlText(lineSpacing: CGFloat = 22,
					   alignment: NSTextAlignment = .left,
					   paragraphSpacing: CGFloat = 0.0,
					   color: UIColor = .black,
					   fontSize: CGFloat = 16,
					   fontName: String = "Vodafone Rg") -> NSMutableAttributedString? {
		let styleText = "<html> <head> <style type='text/css'> body { font: \(fontSize)px '\(fontName)'}</style></head> <body>"
		let html: String = styleText + self
		if let htmlData: Data = html.data(using: String.Encoding.unicode) {
			do {
				let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
								NSAttributedString.DocumentType.html]
				let attributedText = try NSMutableAttributedString(data: htmlData,
																   options: options, documentAttributes: nil)
				let paragraphStyle = NSMutableParagraphStyle()
				paragraphStyle.minimumLineHeight = lineSpacing
				paragraphStyle.alignment = alignment
				paragraphStyle.paragraphSpacing = paragraphSpacing
				
				let range = NSMakeRange(0, attributedText.length)
				let attrs = [NSAttributedString.Key.paragraphStyle: paragraphStyle,
							 NSAttributedString.Key.foregroundColor: color]
				attributedText.addAttributes(attrs, range: range)
				return attributedText
			} catch let error as NSError {
				print("Couldn't translate \(String(describing: String.self)): \(error.localizedDescription) ")
			}
		}
		return nil
	}
	
	func convertToHtml3(fontSize: CGFloat = 16, fontName: String = "Vodafone Rg" ,color : UIColor? = nil , lineSpacing : CGFloat = 0, paragraphSpacingBefore : CGFloat = 0, alignment: NSTextAlignment = NSTextAlignment.left, defaultColor: UIColor? = nil) -> NSMutableAttributedString?{
		let defColor: String? = nil
		let styleText = "<html><head><style type='text/css'> body { font: \(fontSize)px '\(fontName)'\(defColor != nil ? "; color:\(defColor!)":"")} </style></head><body>"
		let html = styleText + self
		if let htmlData = html.data(using: String.Encoding.utf8) {
			do {
				let attributedText = try NSMutableAttributedString(data: htmlData, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
																							 .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
				let paragraphStyle = NSMutableParagraphStyle()
				paragraphStyle.alignment = alignment
				paragraphStyle.lineSpacing = lineSpacing
				paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
				paragraphStyle.lineHeightMultiple = 22.0
				paragraphStyle.maximumLineHeight = 22.0
				paragraphStyle.minimumLineHeight = 22.0
				paragraphStyle.paragraphSpacing = 22.0
				
				if color == nil {
					attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedText.length))
				}
				else {
					attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle , NSAttributedString.Key.foregroundColor : color!], range: NSMakeRange(0, attributedText.length))
				}
				return attributedText
			} catch _ as NSError {
				print("Couldn't translate")
			}
		}
		return NSMutableAttributedString()
	}
}
