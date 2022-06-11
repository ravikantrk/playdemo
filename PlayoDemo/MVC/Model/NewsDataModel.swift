//
//  NewsDataModel.swift
//  PlayoDemo
//
//  Created by Ravi kant Tiwari on 11/06/22.
//

import Foundation

class NewsDataModel: NSObject {
    var author : String = ""
    var content : String = ""
    var descriptions : String = ""
    var publishedAt : String = ""
    var source : [String:Any] = [:]
    var title : String = ""
    var url : String = ""
    var urlToImage : String = ""



    static func giveList(list : [[String:Any]]) -> [NewsDataModel]{
        var dataArray = [NewsDataModel]()
        for item in list{
            dataArray.append(giveObj(obj: item))
        }
        return dataArray
    }


    static func giveObj(obj : [String : Any]) -> NewsDataModel {
        let object = NewsDataModel()

        object.author = obj["author"] as? String ?? ""
        object.content = obj["content"] as? String ?? ""
        object.descriptions = obj["description"] as? String ?? ""
        object.publishedAt = obj["publishedAt"] as? String ?? ""
        object.source = obj["source"] as? [String:Any] ?? [:]
        object.title = obj["title"] as? String ?? ""
        object.url = obj["url"] as? String ?? ""
        object.urlToImage = obj["urlToImage"] as? String ?? ""


        return object

    }

}

