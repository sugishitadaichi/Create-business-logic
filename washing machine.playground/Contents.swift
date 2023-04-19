protocol WashingMachineDeligate {
    func washingMachinedidEndWashing(washingTime: Int)
}
// deligate = class間の処理を呼び出す際に使用

// Controller class = 通知を受け取る側
class Controller: WashingMachineDeligate {
    let washingMachine = WashingMachine()
    
    func startWashing() {
        
        registerDeligate()
        print("洗濯開始！")
        washingMachine.washing()
    }
    var washingTimeLimit = 3
    
    func washingMachinedidEndWashing(washingTime: Int) {
        let isWashingTimeLimit = washingTimeLimit <= washingTime
        if isWashingTimeLimit {
            washingMachine.shouldStopWashing = true
            notificationSound()
        }
    }
    func registerDeligate() {
        washingMachine.deligate = self
    }
    
    func notificationSound() {
        print("♪ ♪ ♪")
    }
}

//WashingMachine class =  通知を送る側
class WashingMachine {
    var shouldStopWashing = false
    var washingTime = 0
    var deligate: WashingMachineDeligate?
    
    func washing() {
        while !shouldStopWashing {
            washingTime += 1
            print("🧺してます、\(washingTime)0分経過。")
            deligate?.washingMachinedidEndWashing(washingTime: washingTime) //通知を送っている処理
        }
    }
}

let controller = Controller()
controller.startWashing()
