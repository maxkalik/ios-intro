protocol NetworkManager {
    func getData()
}

class HTTPNetworkManager: NetworkManager {
    func getData() {
        print("All data from HTTP network manager")
    }
}

class TCPNetworkManager: NetworkManager {
    func getData() {
        print("All data from TCP network manager")
    }
}

class Controller {
    var networkManager: NetworkManager?
}

let controller = Controller()
controller.networkManager = HTTPNetworkManager()
controller.networkManager?.getData() // All data from HTTP network manager

controller.networkManager = TCPNetworkManager()
controller.networkManager?.getData() // All data from TCP network manager

// If dependencies getting a lot - in this case can use Factory (Container of Dependecies)
