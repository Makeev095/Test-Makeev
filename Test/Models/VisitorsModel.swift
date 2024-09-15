//
//  VisitorsModel.swift
//  Test
//
//  Created by Макей 😈 on 12.09.2024.
//

import Foundation

// Модель данных для парсинга ответа от API
struct VisitorsResponse: Codable {
    let statistics: [VisitorData]
}

struct VisitorData: Codable {
    let user_id: Int
}
