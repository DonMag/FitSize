//
//  ViewController.swift
//  FitSize
//
//  Created by Don Mag on 9/27/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class TestView: UIView
{
	let label_A     = UILabel()
	let label_B     = UILabel()
	
	override init(frame: CGRect)            { super.init(frame: frame);     setup() }
	required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder);  setup() }
	func setup()
	{
		let view_BG     = UIView()
		let view_LineH  = UIView()
		
		// Configure
		view_BG.backgroundColor = .white
		view_BG.layer.cornerRadius = 6
		
		view_LineH.backgroundColor = .gray
		
		label_A.numberOfLines = 0
		label_A.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)
		label_A.textColor = .red
		label_B.numberOfLines = 0
		label_B.textColor = .blue
		label_B.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)
		
		label_A.text = "TestA"
		label_B.text = "Experiment with Swift standard library types and learn high-level concepts using visualizations and practical examples. Learn how the Swift standard library uses protocols and generics to express powerful constraints. Download the playground below to get started."
		
		// Assemble
		self.addSubview(view_BG)
		view_BG.addSubview(label_A)
		view_BG.addSubview(view_LineH)
		view_BG.addSubview(label_B)
		
		view_BG.translatesAutoresizingMaskIntoConstraints = false
		label_A.translatesAutoresizingMaskIntoConstraints = false
		label_B.translatesAutoresizingMaskIntoConstraints = false
		view_LineH.translatesAutoresizingMaskIntoConstraints = false
		
		// Layout
		view_BG.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
		view_BG.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0).isActive = true
		view_BG.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
		view_BG.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
		
		
		label_A.topAnchor.constraint(equalTo: view_BG.topAnchor, constant: 0.0).isActive = true
		label_A.leftAnchor.constraint(equalTo: view_BG.leftAnchor, constant: 0.0).isActive = true
		label_A.rightAnchor.constraint(equalTo: view_BG.rightAnchor, constant: 0.0).isActive = true
		
		label_B.leftAnchor.constraint(equalTo: view_BG.leftAnchor, constant: 0.0).isActive = true
		label_B.rightAnchor.constraint(equalTo: view_BG.rightAnchor, constant: 0.0).isActive = true
		label_B.bottomAnchor.constraint(equalTo: view_BG.bottomAnchor, constant: 0.0).isActive = true
		
		view_LineH.leftAnchor.constraint(equalTo: view_BG.leftAnchor, constant: 0.0).isActive = true
		view_LineH.rightAnchor.constraint(equalTo: view_BG.rightAnchor, constant: 0.0).isActive = true
		
		view_LineH.topAnchor.constraint(equalTo: label_A.bottomAnchor, constant: 0.0).isActive = true
		label_B.topAnchor.constraint(equalTo: view_LineH.bottomAnchor, constant: 0.0).isActive = true
		
		view_LineH.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
		
	}
}


class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// just for ease fo seeing view frames
		view.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.4, alpha: 1.0)

		let v = TestView()
		let targSize = CGSize(width: 200, height: 10000)
		let fitSize = v.systemLayoutSizeFitting(targSize, withHorizontalFittingPriority: UILayoutPriorityDefaultHigh, verticalFittingPriority: UILayoutPriorityFittingSizeLevel)
		
		print(fitSize)
		
		let pt = CGPoint(x: 40, y: 120)
		v.frame = CGRect(origin: pt, size: fitSize)
		
		view.addSubview(v)
		
	}

}

