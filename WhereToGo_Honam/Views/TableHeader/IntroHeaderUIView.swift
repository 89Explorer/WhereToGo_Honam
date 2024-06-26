//
//  IntroHeaderUIView.swift
//  WhereToGo_Honam
//
//  Created by 권정근 on 6/26/24.
//

import UIKit

class IntroHeaderUIView: UIView {
    
    // MARK: - UI Components
    private let introHeadeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "introImage.png")
        return imageView
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1.5
        return button
    }()
    
    private let backImageView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(introHeadeImageView)
        addGradient()
//        addSubview(detailButton)
        
        
//        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        introHeadeImageView.frame = bounds
    }
    
    
    
    // MARK: - Functions
    /// set gradient to imageView
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    
    // MARK: - UI Contraints
    private func configureConstraints() {
        let detailButtonConstraints = [
            detailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            detailButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(detailButtonConstraints)
    }
}
