//
//  PortfolioContainerServices.swift
//  Cryptonica
//
//  Created by Максим Боталов on 02.10.2023.
//

import Foundation
import CoreData

class PortfolioContainerServices {
    
    private let coreDataContainer: NSPersistentContainer
    private let nameCoreDataContainer = "PortfolioContainer"
    private let portfolioEntity = "PortfolioEntity"
    
    @Published var savedEntities = [PortfolioEntity]()
    
    init() {
        coreDataContainer = NSPersistentContainer(name: nameCoreDataContainer)
        coreDataContainer.loadPersistentStores { [weak self] _, error in
            if let error = error {
                print("Error loading: \(error.localizedDescription.uppercased())")
            }
            self?.getPortfolio()
        }
    }
    
    func updatePortfolio(for coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(for: entity, amount: amount)
            } else {
                delete(for: entity)
            }
        } else {
            add(for: coin, amount: amount)
        }
    }
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: portfolioEntity)
        
        do {
            savedEntities = try coreDataContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription.uppercased())")
        }
    }
    
    private func add(for coin: CoinModel, amount: Double) {
        let portfolioEntity = PortfolioEntity(context: coreDataContainer.viewContext)
        portfolioEntity.coinID = coin.id
        portfolioEntity.amount = amount
        applyChange()
    }
    
    private func update(for entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChange()
    }
    
    private func delete(for entity: PortfolioEntity) {
        coreDataContainer.viewContext.delete(entity)
        applyChange()
    }
    
    private func save() {
        do {
            try coreDataContainer.viewContext.save()
        } catch let error {
            print("Error saving: \(error.localizedDescription.uppercased())")
        }
    }
    
    private func applyChange() {
        save()
        getPortfolio()
    }
}
