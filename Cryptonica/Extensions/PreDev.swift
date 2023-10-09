//
//  PreDev.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: PreDev {
        return PreDev.instance
    }
}

class PreDev {
    static let instance = PreDev()
    
    private init() {}
    
    let coin = CoinModel(id: "bitcoin",
                         symbol: "btc",
                         name: "Bitcoin",
                         image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                         currentPrice: 26202.006862832088,
                         marketCap: 511219453845,
                         marketCapRank: 1,
                         fullyDilutedValuation: 550624333659,
                         totalVolume: 9515544334,
                         high24H: 26295,
                         low24H: 26102,
                         priceChange24H: -53.8133929217729,
                         priceChangePercentage24H: -0.20496,
                         marketCapChange24H: -621960812.7403564,
                         marketCapChangePercentage24H: -0.12151,
                         circulatingSupply: 19497156,
                         totalSupply: 21000000,
                         maxSupply: 21000000,
                         ath: 69045,
                         athChangePercentage: -62.02434,
                         athDate: "2021-11-10T14:24:11.849Z",
                         atl: 67.81,
                         atlChangePercentage: 38567.73786,
                         atlDate: "2013-07-06T00:00:00.000Z",
                         lastUpdated: "2023-09-27T08:26:06.620Z",
                         sparklineIn7D: SparklineIn7D(price: [27060.883660753127,
                                                              27038.933885562554,
                                                              27112.464832074555,
                                                              27183.312737946195,
                                                              27025.22452404166,
                                                              27063.877293712478,
                                                              27107.755442112102,
                                                              27072.451101145525,
                                                              27181.891317975704,
                                                              27120.178968917484,
                                                              27190.18445834599,
                                                              27186.05265473318,
                                                              27203.95735554073,
                                                              27149.589756459616,
                                                              26936.571052710085,
                                                              27076.340775259883,
                                                              27145.01073656103,
                                                              27110.600552890646,
                                                              27115.846446970816,
                                                              27050.541305794104,
                                                              27024.914837344724,
                                                              26974.56757296705,
                                                              27030.236258658922,
                                                              27102.020623711906,
                                                              27068.20100990383,
                                                              27067.514532949186,
                                                              26993.699990949342,
                                                              26920.45025229596,
                                                              26739.995111014814,
                                                              26626.573309357234,
                                                              26755.584980445696,
                                                              26648.834080478802,
                                                              26418.52778477277,
                                                              26576.97810175096,
                                                              26639.52880783224,
                                                              26577.034378575376,
                                                              26660.435061525113,
                                                              26610.05552034763,
                                                              26603.939431757222,
                                                              26584.396598068863,
                                                              26593.195069864574,
                                                              26589.232106802505,
                                                              26561.133454198716,
                                                              26639.641861578562,
                                                              26637.636327006938,
                                                              26578.905206148003,
                                                              26626.378906818343,
                                                              26648.00124709664,
                                                              26637.914728114418,
                                                              26608.789028776486,
                                                              26672.355811811238,
                                                              26662.581883179126,
                                                              26642.19156124197,
                                                              26589.562536733414,
                                                              26642.349940444896,
                                                              26590.721839939364,
                                                              26590.318346408505,
                                                              26688.33796153136,
                                                              26635.9956475043,
                                                              26594.50364952432,
                                                              26584.86501070471,
                                                              26581.657981099415,
                                                              26547.829784907477,
                                                              26534.177936540287,
                                                              26563.985676592565,
                                                              26582.589416632578,
                                                              26581.967576018324,
                                                              26592.91317293783,
                                                              26585.290471612167,
                                                              26545.492871251507,
                                                              26536.561163334205,
                                                              26556.352013285596,
                                                              26540.550300446146,
                                                              26584.65994469058,
                                                              26588.0877783081,
                                                              26568.05854124356,
                                                              26569.61170975327,
                                                              26570.72759500637,
                                                              26568.85782887614,
                                                              26556.154413845245,
                                                              26564.64627526254,
                                                              26568.125190131854,
                                                              26577.180354824755,
                                                              26590.201409894365,
                                                              26601.829342720674,
                                                              26615.098925655053,
                                                              26610.27539472885,
                                                              26587.030719433697,
                                                              26568.478097013893,
                                                              26575.52911690974,
                                                              26573.9234797301,
                                                              26576.201789893425,
                                                              26587.336388850297,
                                                              26586.008804555724,
                                                              26560.723350938522,
                                                              26569.875558372973,
                                                              26562.281185542444,
                                                              26550.45340587291,
                                                              26561.17840053706,
                                                              26579.929451350046,
                                                              26588.80815731327,
                                                              26579.491960979794,
                                                              26597.32744006094,
                                                              26605.1606539787,
                                                              26597.821687761414,
                                                              26589.797665663824,
                                                              26580.92820338404,
                                                              26570.733979097706,
                                                              26657.753582685626,
                                                              26600.275121547336,
                                                              26447.45930249158,
                                                              26505.53480594746,
                                                              26519.93457602045,
                                                              26503.235602590674,
                                                              26257.58376993293,
                                                              26197.46011142378,
                                                              26199.403236385315,
                                                              26166.655202208483,
                                                              26156.621770098798,
                                                              26145.617391107404,
                                                              26117.151507594062,
                                                              26138.4925731258,
                                                              26181.383887893517,
                                                              26128.669159227582,
                                                              26059.043074839537,
                                                              26086.860590577646,
                                                              26077.019560024095,
                                                              26089.099069634845,
                                                              26138.435787005466,
                                                              26110.04755445133,
                                                              26242.580851196097,
                                                              26317.635405795543,
                                                              26357.55015326377,
                                                              26335.400366914426,
                                                              26344.908159924624,
                                                              26310.628891942943,
                                                              26257.316593042888,
                                                              26287.076366997982,
                                                              26296.92231737691,
                                                              26277.764253277604,
                                                              26286.125407384083,
                                                              26331.579435404343,
                                                              26347.306498337617,
                                                              26339.181988547076,
                                                              26315.66494004243,
                                                              26271.546235087877,
                                                              26273.770004029095,
                                                              26274.95856780814,
                                                              26272.560104308588,
                                                              26232.387655871495,
                                                              26242.655160865525,
                                                              26216.589643826963,
                                                              26218.81871171417,
                                                              26180.78081214982,
                                                              26111.574712349553,
                                                              26217.795567371588,
                                                              26180.151205932874,
                                                              26158.96300512369,
                                                              26252.577052683107,
                                                              26175.70955457768,
                                                              26154.819323615397,
                                                              26151.495531909033,
                                                              26204.75759083597,
                                                              26218.080459481796,
                                                              26251.30733492169,
                                                              26219.37883759674,
                                                              26262.327552470317,
                                                              26242.486177466555]),
                         priceChangePercentage24HInCurrency: -0.2049579575026985,
                         currentHoldings: 0)
    
    let statisticData = StatisticsModel(title: "Title", value: "Value", percentageChange: 100.00)
    
    let statistics = [
        StatisticsModel(title: "Market Cup", value: "12.7Tr", percentageChange: 24.78),
        StatisticsModel(title: "Market Cup", value: "12.7Tr"),
        StatisticsModel(title: "Market Cup", value: "12.7Tr"),
        StatisticsModel(title: "Market Cup", value: "12.7Tr", percentageChange: -24.78)]
    
    let marketData = GlobalDataModel(data: MarketDataModel(totalMarketCap: ["btc": 41180770.988987304,
                                                                      "eth": 673167750.5863012,
                                                                      "ltc": 17144255909.685066,
                                                                      "bch": 4598475817.429087,
                                                                      "bnb": 5161490367.959681,
                                                                      "eos": 1946560549320.3733,
                                                                      "xrp": 2202190103088.152,
                                                                      "xlm": 9789097930503.818,
                                                                      "link": 141625373550.172,
                                                                      "dot": 273247694445.24927,
                                                                      "yfi": 211692464.68225697,
                                                                      "usd": 1115437715438.9553,
                                                                      "aed": 4097008305995.8633,
                                                                      "ars": 390434767290981.9,
                                                                      "aud": 1737133618765.1528,
                                                                      "bdt": 122998389952712.19,
                                                                      "bhd": 420543442912.5095,
                                                                      "bmd": 1115437715438.9553,
                                                                      "brl": 5620356016782.29,
                                                                      "cad": 1503576577280.251,
                                                                      "chf": 1021697445271.1813,
                                                                      "clp": 1011200060931185.5,
                                                                      "cny": 8144480023049.092,
                                                                      "czk": 25681767687690.48,
                                                                      "dkk": 7873019292555.8545,
                                                                      "eur": 1055750643285.8175,
                                                                      "gbp": 913552412446.2289,
                                                                      "hkd": 8731791443359.152,
                                                                      "huf": 413669435292968.1,
                                                                      "idr": 17296105722944760,
                                                                      "ils": 4286560214168.989,
                                                                      "inr": 92762156220358.67,
                                                                      "jpy": 166472792020742.5,
                                                                      "krw": 1505581693694712,
                                                                      "kwd": 344795183094.76654,
                                                                      "lkr": 361765567387539.56,
                                                                      "mmk": 2342871837007795,
                                                                      "mxn": 19657526174838.055,
                                                                      "myr": 5251480764286.621,
                                                                      "ngn": 868702892783857.5,
                                                                      "nok": 11946811993380.303,
                                                                      "nzd": 1870128373014.6526,
                                                                      "php": 63289383832337.08,
                                                                      "pkr": 322054754390112.8,
                                                                      "pln": 4894537349033.008,
                                                                      "rub": 107807044042798.16,
                                                                      "sar": 4183504923639.5854,
                                                                      "sek": 12194061032822.191,
                                                                      "sgd": 1523314247654.9414,
                                                                      "thb": 40813866007911.43,
                                                                      "try": 30584159949115.582,
                                                                      "twd": 35855188759365.27,
                                                                      "uah": 41206569240884.266,
                                                                      "vef": 111688778446.9027,
                                                                      "vnd": 27215765047873084,
                                                                      "zar": 21194078437299.8,
                                                                      "xdr": 850826887956.2339,
                                                                      "xag": 49532082574.2736,
                                                                      "xau": 598766965.6476308,
                                                                      "bits": 41180770988987.305,
                                                                      "sats": 4118077098898730.5],
                                                     totalVolume: ["btc": 1994287.5189439117,
                                                                   "eth": 32599924.938482128,
                                                                   "ltc": 830255839.3432868,
                                                                   "bch": 222693327.70182186,
                                                                   "bnb": 249958793.21258768,
                                                                   "eos": 94267331940.34572,
                                                                   "xrp": 106646867736.03575,
                                                                   "xlm": 474062902555.762,
                                                                   "link": 6858582490.172626,
                                                                   "dot": 13232740755.584406,
                                                                   "yfi": 10251766.29847944,
                                                                   "usd": 54018015220.11579,
                                                                   "aed": 198408439993.56158,
                                                                   "ars": 18907834036871.285,
                                                                   "aud": 84125280111.13881,
                                                                   "bdt": 5956521649351.526,
                                                                   "bhd": 20365926116.303238,
                                                                   "bmd": 54018015220.11579,
                                                                   "brl": 272180573289.5987,
                                                                   "cad": 72814663976.2596,
                                                                   "chf": 49478395239.03249,
                                                                   "clp": 48970031697796,
                                                                   "cny": 394417939931.19824,
                                                                   "czk": 1243707379292.9895,
                                                                   "dkk": 381271737621.1241,
                                                                   "eur": 51127511225.68743,
                                                                   "gbp": 44241186609.396645,
                                                                   "hkd": 422860045485.04517,
                                                                   "huf": 20033034155527.594,
                                                                   "idr": 837609567310612.9,
                                                                   "ils": 207587991409.99228,
                                                                   "inr": 4492252231752.981,
                                                                   "jpy": 8061884306622.025,
                                                                   "krw": 72911767030509.33,
                                                                   "kwd": 16697616720.720442,
                                                                   "lkr": 17519452368134.854,
                                                                   "mmk": 113459751986657.52,
                                                                   "mxn": 951967584926.3851,
                                                                   "myr": 254316815656.3061,
                                                                   "ngn": 42069230253426.13,
                                                                   "nok": 578555900663.9102,
                                                                   "nzd": 90565902083.84831,
                                                                   "php": 3064955444671.831,
                                                                   "pkr": 15596351444427.953,
                                                                   "pln": 237030888731.82333,
                                                                   "rub": 5220840630844.053,
                                                                   "sar": 202597266983.80585,
                                                                   "sek": 590529587935.615,
                                                                   "sgd": 73770512755.57945,
                                                                   "thb": 1976519176904.0396,
                                                                   "try": 1481118662887.9915,
                                                                   "twd": 1736382144261.03,
                                                                   "uah": 1995536867378.4624,
                                                                   "vef": 5408823863.990199,
                                                                   "vnd": 1317995249967464.8,
                                                                   "zar": 1026379183486.5957,
                                                                   "xdr": 41203537541.50861,
                                                                   "xag": 2398721823.1438518,
                                                                   "xau": 28996870.570158135,
                                                                   "bits": 1994287518943.9116,
                                                                   "sats": 199428751894391.16],
                                                     marketCapPercentage: ["btc": 47.348537998995575,
                                                                           "eth": 17.862694892538048,
                                                                           "usdt": 7.439553669475285,
                                                                           "bnb": 2.9774237100005747,
                                                                           "xrp": 2.417153962134648,
                                                                           "usdc": 2.2800971683989033,
                                                                           "steth": 1.2965438344062703,
                                                                           "ada": 0.7834264249972229,
                                                                           "doge": 0.7776647217036063,
                                                                           "sol": 0.7250237342868134],
                                                     marketCapChangePercentage24HUsd: 2.7064027346495974))
    
    var coins: [CoinModel] {
        var coins = [CoinModel]()
        coins.append(contentsOf: [coin, coin, coin, coin, coin])
        return coins
    }
    
    let homeScreenViewModel = HomeViewModel()
}
