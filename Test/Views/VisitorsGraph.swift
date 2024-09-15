//
//  VisitorsGraph.swift
//  Test
//
//  Created by Макей 😈 on 12.09.2024.
//

import UIKit

class VisitorsGraph: UIView {
    
    // Создаем первый UIView, который будет отображать график посетителей
    private lazy var visitorsView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var visitorsLabel: UILabel = {
        let visitorsLabel = UILabel()
        visitorsLabel.translatesAutoresizingMaskIntoConstraints = false
        visitorsLabel.text = "Посетители"
        visitorsLabel.font = .systemFont(ofSize: 21, weight: .bold)
        return visitorsLabel
    }()
    
    private lazy var visitorsAmountPerMounth: UILabel = {
        let visitorsAmountPerMounth = UILabel()
        visitorsAmountPerMounth.translatesAutoresizingMaskIntoConstraints = false
        visitorsAmountPerMounth.font = .systemFont(ofSize: 22, weight: .bold)
        return visitorsAmountPerMounth
    }()
    
    private lazy var visitorsAmountPerMounthArrow: UIImageView = {
        let visitorsAmountPerMounthArrow = UIImageView()
        visitorsAmountPerMounthArrow.translatesAutoresizingMaskIntoConstraints = false
        visitorsAmountPerMounthArrow.image = UIImage(named: "visitorsAmountPerMounthArrow")
        return visitorsAmountPerMounthArrow
    }()
    
    private lazy var visitorsPerMounthSecondaryText: UILabel = {
        let visitorsPerMounthSecondaryText = UILabel()
        visitorsPerMounthSecondaryText.translatesAutoresizingMaskIntoConstraints = false
        visitorsPerMounthSecondaryText.text = "Количество посетителей в\nэтом месяце выросло"
        visitorsPerMounthSecondaryText.font = UIFont(name: "Gilroy-Medium", size: 15)
        visitorsPerMounthSecondaryText.numberOfLines = 0
        visitorsPerMounthSecondaryText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return visitorsPerMounthSecondaryText
    }()
    
    private lazy var visitorsGraphImage: UIImageView = {
        let visitorsGraphImage = UIImageView()
        visitorsGraphImage.translatesAutoresizingMaskIntoConstraints = false
        visitorsGraphImage.image = UIImage(named: "visitorsGraphImage")
        return visitorsGraphImage
    }()
    
    // Создаем второй UIView, который будет немного меньше по высоте
    private lazy var innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Инициализатор для настройки UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // Метод для настройки UIView
    private func setupView() {
        addSubview(visitorsView)
        visitorsView.addSubview(visitorsLabel)
        visitorsView.addSubview(innerView)
        innerView.addSubview(visitorsGraphImage)
        innerView.addSubview(visitorsAmountPerMounth)
        innerView.addSubview(visitorsAmountPerMounthArrow)
        innerView.addSubview(visitorsPerMounthSecondaryText)
        
        NSLayoutConstraint.activate([
            
            visitorsLabel.topAnchor.constraint(equalTo: visitorsView.topAnchor, constant: 3),
            visitorsLabel.leadingAnchor.constraint(equalTo: visitorsView.leadingAnchor),
//            visitorsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            visitorsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            visitorsGraphImage.topAnchor.constraint(equalTo: innerView.topAnchor,constant: 25),
            visitorsGraphImage.leadingAnchor.constraint(equalTo: innerView.leadingAnchor,constant: 20),
            visitorsGraphImage.widthAnchor.constraint(equalToConstant: 95),
            visitorsGraphImage.heightAnchor.constraint(equalToConstant: 50),
            
            visitorsAmountPerMounth.leadingAnchor.constraint(equalTo: visitorsGraphImage.trailingAnchor, constant: 20),
            visitorsAmountPerMounth.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 16),
//            visitorsAmountPerMounth.widthAnchor.constraint(equalToConstant: 59),
//            visitorsAmountPerMounth.heightAnchor.constraint(equalToConstant: 25),
            
            visitorsAmountPerMounthArrow.widthAnchor.constraint(equalToConstant: 25),
            visitorsAmountPerMounthArrow.heightAnchor.constraint(equalToConstant: 25),
            visitorsAmountPerMounthArrow.leadingAnchor.constraint(equalTo: visitorsAmountPerMounth.trailingAnchor),
            visitorsAmountPerMounthArrow.topAnchor.constraint(equalTo: visitorsAmountPerMounth.topAnchor),
            
            visitorsPerMounthSecondaryText.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 48),
            visitorsPerMounthSecondaryText.leadingAnchor.constraint(equalTo: visitorsAmountPerMounth.leadingAnchor),
            visitorsPerMounthSecondaryText.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: 20),
//            visitorsPerMounthSecondaryText.widthAnchor.constraint(equalToConstant: 189),
//            visitorsPerMounthSecondaryText.heightAnchor.constraint(equalToConstant: 39),
            
            
            
            // Констрейнты для visitorsView
            visitorsView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            visitorsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            visitorsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            visitorsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            // Констрейнты для innerView
            innerView.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 10),
            innerView.leadingAnchor.constraint(equalTo: visitorsView.leadingAnchor),
            innerView.trailingAnchor.constraint(equalTo: visitorsView.trailingAnchor),
//            innerView.bottomAnchor.constraint(equalTo: visitorsView.bottomAnchor)
            innerView.heightAnchor.constraint(equalToConstant: 98)
        ])
    }
    
    // Метод для обновления количества посетителей
    func updateVisitorsCount(_ count: Int) {
        visitorsAmountPerMounth.text = "\(count)"
    }
}
