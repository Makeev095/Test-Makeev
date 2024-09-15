////
////  ChartViewManager.swift
////  Test
////
////  Created by Макей 😈 on 12.09.2024.
////
//
//import UIKit
//import Charts
//import DGCharts
//
//class ChartViewManager: NSObject {
//    
//    // Ссылка на контейнер, в котором будет отображаться график
//    private weak var containerView: UIView?
//    
//    // Ссылка на LineChartView
//    private let lineChartView: LineChartView = {
//        let chartView = LineChartView()
//        chartView.translatesAutoresizingMaskIntoConstraints = false
//        return chartView
//    }()
//    
//    // Кнопки
//    private let dayButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("По дням", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    private let weekButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("По неделям", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    private let monthButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("По месяцам", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    // Инициализатор
//    init(containerView: UIView) {
//        self.containerView = containerView
//        super.init()
//        setupUI()
//    }
//    
//    // Настройка UI
//    private func setupUI() {
//        
//        // Настройка LineChartView
//        setupLineChartView()
//        
//        // Добавление кнопок
//        containerView!.addSubview(dayButton)
//        containerView!.addSubview(weekButton)
//        containerView!.addSubview(monthButton)
//        
//        // Установка AutoLayout для кнопок
//        NSLayoutConstraint.activate([
//            dayButton.topAnchor.constraint(equalTo: (containerView?.safeAreaLayoutGuide.topAnchor)!, constant: 20),
//            dayButton.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor, constant: 20),
//            
//            weekButton.topAnchor.constraint(equalTo: dayButton.topAnchor),
//            weekButton.leadingAnchor.constraint(equalTo: dayButton.trailingAnchor, constant: 20),
//            
//            monthButton.topAnchor.constraint(equalTo: dayButton.topAnchor),
//            monthButton.leadingAnchor.constraint(equalTo: weekButton.trailingAnchor, constant: 20),
//            
//            lineChartView.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20),
//            lineChartView.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor),
//            lineChartView.trailingAnchor.constraint(equalTo: containerView!.trailingAnchor),
//            lineChartView.bottomAnchor.constraint(equalTo: containerView!.bottomAnchor),
//        ])
//        
//        // Добавление действий на кнопки
//        dayButton.addTarget(self, action: #selector(showDailyData), for: .touchUpInside)
//        weekButton.addTarget(self, action: #selector(showWeeklyData), for: .touchUpInside)
//        monthButton.addTarget(self, action: #selector(showMonthlyData), for: .touchUpInside)
//    }
//    
//    private func setupLineChartView() {
//        guard let containerView = containerView else { return }
//        containerView.addSubview(lineChartView)
//        lineChartView.backgroundColor = .white
//        // Дополнительные настройки графика
//        lineChartView.xAxis.labelPosition = .bottom
//        lineChartView.rightAxis.enabled = false
//    }
//    
//    @objc private func showDailyData() {
//        // Логика для отображения данных по дням
//        updateChartData(for: .daily)
//    }
//    
//    @objc private func showWeeklyData() {
//        // Логика для отображения данных по неделям
//        updateChartData(for: .weekly)
//    }
//    
//    @objc private func showMonthlyData() {
//        // Логика для отображения данных по месяцам
//        updateChartData(for: .monthly)
//    }
//    
//    private func updateChartData(for interval: TimeInterval) {
//        // Логика для обновления данных графика
//        var dataEntries: [ChartDataEntry] = []
//        
//        // Пример генерации данных
//        let values = getValues(for: interval)
//        
//        for (index, value) in values.enumerated() {
//            let dataEntry = ChartDataEntry(x: Double(index), y: value)
//            dataEntries.append(dataEntry)
//        }
//        
//        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Данные")
//        lineChartDataSet.colors = [NSUIColor.blue] // Цвет линии
//        lineChartDataSet.valueColors = [NSUIColor.black] // Цвет значений
//        
//        let lineChartData = LineChartData(dataSet: lineChartDataSet)
//        lineChartView.data = lineChartData
//        lineChartView.notifyDataSetChanged() // Обновить график
//    }
//    
//    private func getValues(for interval: TimeInterval) -> [Double] {
//        // Логика для получения данных в зависимости от выбранного интервала
//        switch interval {
//        case .daily:
//            return [1, 2, 1, 3] // Пример данных по дням
//        case .weekly:
//            return [2, 2.5, 3, 3.5] // Пример данных по неделям
//        case .monthly:
//            return [5, 4, 7, 8] // Пример данных по месяцам
//        }
//    }
//}
//
//enum TimeInterval {
//    case daily
//    case weekly
//    case monthly
//}


import UIKit
import Charts
import DGCharts

class ChartViewManager: NSObject {

    // Ссылка на контейнер, в котором будет отображаться график
    private weak var containerView: UIView?

    // Ссылка на LineChartView
    private let lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()

    // Кнопки
    private let dayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("По дням", for: .normal)
        button.layer.borderColor = UIColor(red: 233, green: 233, blue: 234, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Gilroy", size: 15)
        button.setTitleColor(.white, for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let weekButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("По неделям", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let monthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("По месяцам", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Ссылка на NetworkService
    private let networkService = NetworkService()

    // Инициализатор
    init(containerView: UIView) {
        self.containerView = containerView
        super.init()
        setupUI()
    }
    
    // Настройка UI
    private func setupUI() {
        setupLineChartView()
        
        // Добавление кнопок
        containerView!.addSubview(dayButton)
        containerView!.addSubview(weekButton)
        containerView!.addSubview(monthButton)
        
        // Установка AutoLayout для кнопок
        NSLayoutConstraint.activate([
            dayButton.topAnchor.constraint(equalTo: (containerView?.safeAreaLayoutGuide.topAnchor)!, constant: 10),
            dayButton.widthAnchor.constraint(equalToConstant: 114),
            dayButton.heightAnchor.constraint(equalToConstant: 32),
            dayButton.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor, constant: 10),
            
            weekButton.topAnchor.constraint(equalTo: dayButton.topAnchor),
            weekButton.widthAnchor.constraint(equalToConstant: 114),
            weekButton.heightAnchor.constraint(equalToConstant: 32),
            weekButton.leadingAnchor.constraint(equalTo: dayButton.trailingAnchor, constant: 10),
            
            monthButton.topAnchor.constraint(equalTo: dayButton.topAnchor),
            monthButton.widthAnchor.constraint(equalToConstant: 114),
            monthButton.heightAnchor.constraint(equalToConstant: 32),
            monthButton.leadingAnchor.constraint(equalTo: weekButton.trailingAnchor, constant: 10),
            
            lineChartView.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20),
            lineChartView.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor),
            lineChartView.trailingAnchor.constraint(equalTo: containerView!.trailingAnchor),
            lineChartView.bottomAnchor.constraint(equalTo: containerView!.bottomAnchor),
        ])
        
        // Добавление действий на кнопки
        dayButton.addTarget(self, action: #selector(showDailyData), for: .touchUpInside)
        weekButton.addTarget(self, action: #selector(showWeeklyData), for: .touchUpInside)
        monthButton.addTarget(self, action: #selector(showMonthlyData), for: .touchUpInside)
    }
    
    private func setupLineChartView() {
        guard let containerView = containerView else { return }
        containerView.addSubview(lineChartView)
        lineChartView.backgroundColor = .white
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.rightAxis.enabled = false
    }

    // Метод для получения данных о посетителях и обновления графика
    private func fetchVisitors(for interval: TimeInterval) {
        networkService.fetchVisitors { result in
            switch result {
            case .success(let visitorsCount):
                // Здесь вы можете преобразовать количество посетителей в данные для графика
                // В этом примере мы просто создаем массив, однако обычно необходимо использовать временные ряды
                let values = [Double(visitorsCount), Double(visitorsCount) + 5, Double(visitorsCount) - 2, Double(visitorsCount) + 3] // Имитация данных
                DispatchQueue.main.async {
                    self.updateChartData(for: interval, with: values)
                }
                
            case .failure(let error):
                print("Ошибка получения данных о посетителях: \(error)")
            }
        }
    }

    @objc private func showDailyData() {
        fetchVisitors(for: .daily)
    }
    
    @objc private func showWeeklyData() {
        fetchVisitors(for: .weekly)
    }
    
    @objc private func showMonthlyData() {
        fetchVisitors(for: .monthly)
    }
    
    private func updateChartData(for interval: TimeInterval, with values: [Double]) {
        var dataEntries: [ChartDataEntry] = []

        for (index, value) in values.enumerated() {
            let dataEntry = ChartDataEntry(x: Double(index), y: value)
            dataEntries.append(dataEntry)
        }

        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Посетители")
        lineChartDataSet.colors = [NSUIColor.blue]
        lineChartDataSet.valueColors = [NSUIColor.black]

        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        lineChartView.notifyDataSetChanged()
    }
}

enum TimeInterval {
    case daily
    case weekly
    case monthly
}
