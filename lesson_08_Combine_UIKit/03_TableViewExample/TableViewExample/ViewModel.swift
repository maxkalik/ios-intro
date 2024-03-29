//
//  ViewModel.swift
//  TableViewExample
//
//  Created by Maksim Kalik on 12/25/22.
//

import Foundation
import Combine

fileprivate let list: [String] = "POET GESTURAL VILLAGE COLOSSAL FINANCIAL ABERRANT ABATTOIR LONER HOMICIDE FAMILY STEEL BARNBURNER PROMISED GOOD-BYE PICNIC CALLOUS CLIMAX SUPERFICIAL TRITE BRUSH LOSS BEEKEEPER ELFIN AUNT DISCLOSURE BLUSHING COWARDLY UNCOVERED DAUGHTER HOOLIGAN FALLACIOUS BLUEPRINT ACHE PUSHY RACKET COSTUMED ARMS EASTERN SPEND GIVE INNER CROOKED MAJESTIC DIAMETRIC MATURE REST PARTICIPATE MIGRATE DESCRIPTION COAL MOW MOLTEN BLINDING GUTS DETAILS EGGS RECALL FRIGHTENING UNSUITABLE REMARKABLE LAMP WATER FUSE PRESERVE SIGN DISTURBANCE SADDLE RUTHLESS GODLESS DASHING UGLY XENOPHOBIC UNADVISED OPERATE FIREARM ASHES ILLEGAL MOTH PITY AGONIZING ABSENCE TWO BLEAKNESS CINNAMON HACK HIRSUTE SILENT CASE NERVE ETERNITY DISTORT THRONE ABIDE CLUBFOOT CURSED DISTANCE COMET OVERT SERUM CRUCIFIER"
    .components(separatedBy: " ")

final class ViewModel {
    
    // MARK: - Before
    func fetchData(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(list)
        }
    }
    
    // MARK: - After
    // Future - a Publisher with promise (success, failure)
    func fetchData() -> Future<[String], Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                promise(.success(list))
            }
        }
    }
}
