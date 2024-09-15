//
//  ViewController.swift
//  Test
//
//  Created by Макей 😈 on 12.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // Создаем экземпляр NetworkService
     private let networkService = NetworkService()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
         title = "Статистика"
         navigationController?.navigationBar.prefersLargeTitles = true
         
         setupView()
         setupConstraints()
         
         // Загружаем количество посетителей
         loadVisitors()
     }
    
    // Создаем экземпляр VisitorsGraph
    private lazy var visitorsGraph: VisitorsGraph = {
        let graph = VisitorsGraph()
        graph.translatesAutoresizingMaskIntoConstraints = false
        return graph
    }()
    
    private func setupView() {
        view.addSubview(visitorsGraph)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            visitorsGraph.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            visitorsGraph.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            visitorsGraph.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            visitorsGraph.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func loadVisitors() {
         networkService.fetchVisitors { [weak self] result in
             DispatchQueue.main.async {
                 switch result {
                 case .success(let visitorsCount):
                     // Обновляем UI с количеством посетителей
                     self?.updateVisitorsGraph(with: visitorsCount)
                 case .failure(let error):
                     // Обрабатываем ошибку
                     print("Failed to fetch visitors: \(error)")
                 }
             }
         }
     }
     
     private func updateVisitorsGraph(with visitorsCount: Int) {
         // Обновляем UI с количеством посетителей
         print("Visitors count: \(visitorsCount)")
         // Здесь можно добавить логику для обновления VisitorsGraph
         visitorsGraph.updateVisitorsCount(visitorsCount)
     }
}
