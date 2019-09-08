//
//  Sql.swift
//  GoStruct
//
//  Created by kingcheung on 1/9/2019.
//  Copyright © 2019 kingcheung. All rights reserved.
//

//CREATE TABLE `user` (
//    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
//    `role_id` int(11) unsigned NOT NULL DEFAULT '0',
//    `username` varchar(20) NOT NULL DEFAULT '',
//    `password` char(32) NOT NULL DEFAULT '',
//    `salt` char(10) NOT NULL DEFAULT '',
//    `truename` varchar(10) NOT NULL DEFAULT '',
//    `mobile` varchar(20) NOT NULL DEFAULT '',
//    `email` varchar(500) NOT NULL DEFAULT '',
//    `status` int(11) unsigned NOT NULL DEFAULT '0',
//    `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
//    `last_login_ip` varchar(50) NOT NULL DEFAULT '',
//    `ctime` int(11) unsigned NOT NULL DEFAULT '0',
//    PRIMARY KEY (`id`),
//    KEY `idx_username` (`username`),
//    KEY `idx_email` (`email`(20))
//) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


import Foundation


class Parser {
    
    var sql:String?
    var token:[Substring]?
    
    init(sql:String) {
        self.sql = sql
        token = getToken()
    }
    
    func getToken() -> [Substring] {
        //按空格切割
        guard var token = self.sql?.split(separator: " ") else { return [] }
        //可能存在 ( 和 ) 字符挨着的
        
        token = token.filter { $0 != ";" || $0 != " "}
        return token
    }
    
    func peek() -> String {
        return ""
    }
    
    
    /// 匹配出空格
//    func getTokenWhitespace(code:String) -> Any {
//        return Any{}
//    }
}


