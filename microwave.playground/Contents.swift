// 機能要件
//・500W、600W、700Wの設定ができる
//・対象商品は「ご飯」「パスタ」「ピザ」とする
//・「ご飯」は500W　20秒で温めができる
//・「パスタ」は600W　20秒で温めができる
//・「ピザ」は700W　30秒で温めができる
//・電子レンジのW数と商品の解凍可能W数を比較し、解凍可能W数の場合に解凍可能フラグを返す

// 機能要件(例外パターン)
//・次の温めを行う時にW数を指定しない場合、前回のW数を引き継ぐ
//・W数や時間が満たされない場合、温めできない


class MicroWave {
    // 食べ物それぞれのW数を定義する
    var watt = 0 //ワット
    var riceWatt = 500
    var pastaWatt = 600
    var pizzaWatt = 700
    
    //　食べ物それぞれの温め時間を定義する
    var warmtime = 0 //秒
    var riceWarmTime = 20
    var pastaWarmTime = 20
    var pizzaWarmTime = 30
    
    enum warmType {
        case rice
        case pasta
        case pizza
    }
    
    func warmFood(type: warmType) -> Bool {
        var isWarmable = false
        switch type {
            
        case .rice:
            isWarmable = riceWatt >= watt
        case .pasta:
            isWarmable = pastaWatt >= watt
        case .pizza:
            isWarmable = pizzaWatt >= watt
        }
        return isWarmable
    }
    
    func warmFoodTime(type: warmType) -> Bool {
        var isWarmtimeable = false
        switch type {
            
        case .rice:
            isWarmtimeable = riceWarmTime >= warmtime
        case .pasta:
            isWarmtimeable = pastaWarmTime >= warmtime
        case .pizza:
            isWarmtimeable = pizzaWarmTime >= warmtime
        }
        return isWarmtimeable
    }
    
    }

let microwave = MicroWave()
microwave.watt = 400
microwave.warmtime = 10

let isWarmable = microwave.warmFood(type: .rice)
let isWarmtimeable = microwave.warmFoodTime(type: .rice)
print(isWarmable)
print(isWarmtimeable)

if isWarmable {
    print("現在のW数は\(microwave.watt)Wです。")
} else if isWarmable == false {
    print("現在のW数は\(microwave.watt)Wで、温めできません。")
}

if isWarmtimeable {
    print("現在の温め時間は\(microwave.warmtime)秒です。")
} else if isWarmtimeable == false {
    print("現在の温め時間は\(microwave.warmtime)秒で、温めできません。")
}

