//
//  Model.swift
//  Biography
//
//  Created by Андрей  on 23.10.2021.
//

import Foundation

struct Model {

    let preview: String
    let nameOfProject: String
    let screenshoot: [String]
    let description: String
    
    static func getModel() -> [Model] {
        
        var models: [Model] = []
        let data: Data = Data()
        for index in 0..<data.picturesOfProjects.count {
            let model: Model = Model(preview:data.picturesOfProjects[index],
                                     nameOfProject: data.namesOfProjects[index],
                                     screenshoot: data.pictures[index],
                                     description: data.descriptions[index])
            models.append(model)
        }
        return models
    }
}

struct Data {
    let pictures: [[String]] = [["screen1","screen2","screen3"],["Qscreen1","Qscreen2","Qscreen3"]]
    let descriptions: [String] = ["""
    Мой первый проект на ЯП Swift. Данное приложение было написано за пол года, используя такие технологии как alamofire и фреймворк Realm для сохранения и доступа к данным оффлайн. Загрузка данных происходила из собственного сервера, на котором находилась база данных с кулинарными рецептами. Отправку данных в формате JSON предоставляло API, написанное на языке PHP. Приложение писалось на архитектуре MVC. Отдельное и большое спасибо Александру, Илье и Кнкуш, которые помогали на пути обучения и познания Swift
"""
        ,"Мое второе приложение, написанное при помощи языка программирования Swift. Срок создания - одна неделя. Приложение представляет собой задачник, с возможностью сохранения небольшого объема данных в памяти телефона при помощи UserDefaults."]
    
    let namesOfProjects: [String] = ["Try to fry", "Quizlet"]
    let picturesOfProjects: [String] = ["avatarOfTry", "avatarOfQuizlet"]
}
