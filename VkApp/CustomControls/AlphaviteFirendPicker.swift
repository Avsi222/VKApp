//
//  AlphaviteFirendPicker.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//


import UIKit

enum Day: Int {
    
    case A
    case B
    case V
    case G
    case D
    case E
    case J
    case Z
    case I
    case K
    case L
    case M
    case N
    case O
    case P
    case R
    case S
    case T
    case U
}

extension Day {
    
    var title: String {
        switch self {
        case .A:
            return "А"
        case .B:
            return "Б"
        case .V:
            return "В"
        case .G:
            return "Г"
        case .D:
            return "Д"
        case .E:
            return "Е"
        case .J:
            return "Ж"
        case .Z:
            return "З"
        case .I:
            return "И"
        case .K:
            return "К"
        case .L:
            return "Л"
        case .M:
            return "М"
        case .N:
            return "Н"
        case .O:
            return "О"
        case .P:
            return "П"
        case .R:
            return "Р"
        case .S:
            return "С"
        case .T:
            return "Т"
        case .U:
            return "У"
        }
    }
}

@IBDesignable class WeekDayPicker: UIControl {
    
    var selectedDay: Day? = nil {
        didSet {
            updateSelectedDay()
            self.sendActions(for: UIControl.Event.valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.frame = bounds
    }
    
    private func setupView() {
        for i in 0..<19 {
            if let day = Day(rawValue: i) {
                let button = UIButton.init(type: .system)
                button.setTitle(day.title, for: [])
                button.addTarget(self,
                                 action: #selector(daySelected(_:)),
                                 for: .touchUpInside)
                buttons.append(button)
                stack.addArrangedSubview(button)
            }
        }
        
        stack.spacing = 5
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        addSubview(stack)
    }
    
    private func updateSelectedDay() {
        for i in 0..<19 {
            if let selectedDayIndex = selectedDay?.rawValue {
                buttons[i].isSelected = selectedDayIndex == i
            }
        }
    }
    
    @objc func daySelected(_ button: UIButton) {
        if let index = buttons.index(of: button),
            let day = Day(rawValue: index) {
            selectedDay = day
        }
    }
}
