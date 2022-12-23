//
//  MarketDataModel.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 23/12/2565 BE.
//

import Foundation

// JSON data:
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 12913,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 622,
     "total_market_cap": {
       "btc": 50283578.487351224,
       "eth": 692665145.7176011,
       "ltc": 12832602229.05725,
       "bch": 8340990076.325767,
       "bnb": 3433177996.342346,
       "eos": 953376228771.2656,
       "xrp": 2413107521037.7754,
       "xlm": 11178577291858.283,
       "link": 140890690841.70026,
       "dot": 187297563819.3288,
       "yfi": 151920287.39769086,
       "usd": 846248790263.946,
       "aed": 3107725976169.7466,
       "ars": 147716806952238.34,
       "aud": 1266188751198.1514,
       "bdt": 87157446088519.94,
       "bhd": 318984172753.30084,
       "bmd": 846248790263.946,
       "brl": 4372482874414.7734,
       "cad": 1153695207010.789,
       "chf": 788516005294.5554,
       "clp": 737387345884392.5,
       "cny": 5913078797090.2705,
       "czk": 19326206747652.82,
       "dkk": 5934763076091.998,
       "eur": 798050690414.4628,
       "gbp": 703302983358.9298,
       "hkd": 6603148141867.069,
       "huf": 319734666800448.8,
       "idr": 13210099624523414,
       "ils": 2949645855899.6533,
       "inr": 70135832056387.94,
       "jpy": 112306100080323.34,
       "krw": 1082878594036343.5,
       "kwd": 259304169317.51697,
       "lkr": 309686095410159.75,
       "mmk": 1779241405595191,
       "mxn": 16530623869015.912,
       "myr": 3748459016474.139,
       "ngn": 377471123643336.6,
       "nok": 8346580590832.146,
       "nzd": 1347658814734.4443,
       "php": 46778096918166.44,
       "pkr": 191692203193192.53,
       "pln": 3704692721539.2695,
       "rub": 58869294555964.92,
       "sar": 3182659614050.0386,
       "sek": 8859564760007.113,
       "sgd": 1143800866155.0212,
       "thb": 29424070437477.363,
       "try": 15794556671244.307,
       "twd": 26003702076988.523,
       "uah": 31292640233805.15,
       "vef": 84734891369.12856,
       "vnd": 19977549077025936,
       "zar": 14523998737542.03,
       "xdr": 636035513269.6368,
       "xag": 35760112842.42944,
       "xau": 471326726.22540647,
       "bits": 50283578487351.23,
       "sats": 5028357848735122
     },
     "total_volume": {
       "btc": 2262622.369676386,
       "eth": 31168021.460326955,
       "ltc": 577431713.057729,
       "bch": 375321552.2775648,
       "bnb": 154483542.48612148,
       "eos": 42899301259.51956,
       "xrp": 108583184049.00012,
       "xlm": 503005152031.4416,
       "link": 6339692566.9834795,
       "dot": 8427873879.145378,
       "yfi": 6835993.996730917,
       "usd": 38078861941.86509,
       "aed": 139839099046.51764,
       "ars": 6646848968224.83,
       "aud": 56975002155.310196,
       "bdt": 3921844728162.205,
       "bhd": 14353408141.504652,
       "bmd": 38078861941.86509,
       "brl": 196749671767.4223,
       "cad": 51913102879.654396,
       "chf": 35481045822.467,
       "clp": 33180397141663.586,
       "cny": 266072239932.58694,
       "czk": 869626009597.3418,
       "dkk": 267047972690.98547,
       "eur": 35910080359.96615,
       "gbp": 31646694819.231007,
       "hkd": 297123457508.7718,
       "huf": 14387178304060.07,
       "idr": 594418054864948.9,
       "ils": 132725929556.91539,
       "inr": 3155919035606.5854,
       "jpy": 5053464807735.884,
       "krw": 48726550580060.164,
       "kwd": 11667972560.778519,
       "lkr": 13935020301489.162,
       "mmk": 80060956806540.89,
       "mxn": 743832489172.3921,
       "myr": 168670318971.49097,
       "ngn": 16985159647639.953,
       "nok": 375573110013.92035,
       "nzd": 60640930352.177536,
       "php": 2104885365797.0588,
       "pkr": 8625620532289.128,
       "pln": 166700956389.58163,
       "rub": 2648955916749.254,
       "sar": 143210906113.7459,
       "sek": 398655983019.013,
       "sgd": 51467884825.830025,
       "thb": 1324002029718.6472,
       "try": 710711495055.3568,
       "twd": 1170094885522.0159,
       "uah": 1408082517775.7256,
       "vef": 3812836446.2389345,
       "vnd": 898934618274177.5,
       "zar": 653539891735.8411,
       "xdr": 28619844162.333992,
       "xag": 1609106465.6383972,
       "xau": 21208402.947141137,
       "bits": 2262622369676.386,
       "sats": 226262236967638.6
     },
     "market_cap_percentage": {
       "btc": 38.2654866237098,
       "eth": 17.40287759889455,
       "usdt": 7.830658228082564,
       "usdc": 5.222956517731674,
       "bnb": 4.75760233957218,
       "busd": 2.1250826057133345,
       "xrp": 2.088517845500173,
       "doge": 1.2752643842946065,
       "ada": 1.0729070911299792,
       "matic": 0.8491372164429261
     },
     "market_cap_change_percentage_24h_usd": 0.3038629096493351,
     "updated_at": 1671776304
   }
 }
 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        
        /*
        if let item = totalMarketCap.first(where: { (key, value) -> Bool in
            return key == "usd"
        }) {
            return "\(item.value)"
        }
         */
        
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
    
}
