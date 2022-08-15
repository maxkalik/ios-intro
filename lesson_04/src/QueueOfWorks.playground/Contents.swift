import UIKit

enum NetworkError: Error {
    case noData
}

class SessionManager {
    
    var someBool: Bool = true
    
    func prepareSessionData(completion: @escaping (String?) -> Void) {
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "com.maxkalik.prepare.session.data", attributes: .concurrent)
        var tasks: [DispatchWorkItem] = []
        
        var someData: String?
        
        // MARK: 1
        dispatchGroup.enter()
        let firstTask = DispatchWorkItem(flags: .inheritQoS) { [weak self] in
            guard let self = self else { dispatchGroup.leave(); return }
            
            someData = "Some data Done"
            print("DONE 1")
            dispatchGroup.leave()
        }
        tasks.append(firstTask)
        
        // MARK: 2
        if someBool == true {
            dispatchGroup.enter()
            let secondTask = DispatchWorkItem(flags: .inheritQoS) { [weak self] in
                guard let self = self else { dispatchGroup.leave(); return }
                
                print("DONE 2")
                dispatchGroup.leave()
            }
            tasks.append(secondTask)
        }
        
        // MARK: 3
        dispatchGroup.enter()
        let thirdTask = DispatchWorkItem(flags: .inheritQoS) { [weak self] in
            guard let self = self else { dispatchGroup.leave(); return }
            
            print("DONE 3")
            dispatchGroup.leave()
        }
        tasks.append(thirdTask)
        
        tasks.forEach { queue.async(execute: $0) }
        dispatchGroup.notify(queue: queue) {
            completion(someData)
        }
    }
}

let sessionManager = SessionManager()
//sessionManager.prepareSessionData { result in
//    print("RESULT: \(result)")
//}

// ************************ //

extension SessionManager {
    func asyncPrepareSessionData() async throws -> Int {
        print("async starts")
        if someBool == false {
            throw NetworkError.noData
        }
        
        let one = try await firstTask()
        let two = try await secondTask()
        let three = try await thirdTask()
        return Int(one)! + Int(two)! + Int(three)!
    }
    
    func firstTask() async throws -> String {
        try await Task.sleep(nanoseconds: UInt64(2 * 1_000_000_000))
        print("async 1 done")
        return "1"
    }
    
    func secondTask() async throws -> String {
        try await Task.sleep(nanoseconds: UInt64(2 * 1_000_000_000))
        print("async 2 done")
        return "2"
    }
    
    func thirdTask() async throws -> String {
        try await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))
        print("async 3 done")
        return "3"
    }
}

func doPrepareSession() async {
    do {
        let data = try await sessionManager.asyncPrepareSessionData()
        print(data)
    } catch let error {
        print(error)
    }
}

Task {
    await doPrepareSession()
}
