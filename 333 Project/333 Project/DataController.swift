//
//  DataController.swift
//
//
//  Created by Divya Mehta on 4/7/16.
//
//

import Foundation
import Alamofire
import HTMLReader

//let URLString = "http://www.goprincetontigers.com/main/Schedule.dbml?DB_OEM_ID=10600.htm"

let URLString = "http://www.goprincetontigers.com/main/Schedule.dbml?&DB_OEM_ID=10600&DB_OEM_ID=10600.htm"

class DataController {
    var charts: [Chart]?
    
    
    private func parseHTMLRow(rowElement: HTMLElement) -> Chart? {
        var date: String?
        var team: String?
        var location: String?
        var time: String?
        if let dateColumn = rowElement.childAtIndex(1) as? HTMLElement {
            date = dateColumn.textContent
                .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                .stringByReplacingOccurrencesOfString("\n", withString: "")
        }
        
        if let teamColumn = rowElement.childAtIndex(2) as? HTMLElement {
            team = teamColumn.textContent
                .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                .stringByReplacingOccurrencesOfString("\n", withString: "")
        }
        
        if let locationColumn = rowElement.childAtIndex(4) as? HTMLElement {
            location = locationColumn.textContent
                .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                .stringByReplacingOccurrencesOfString("\n", withString: "")
        }
        
        if let timeColumn = rowElement.childAtIndex(5) as? HTMLElement {
            time = timeColumn.textContent
                .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                .stringByReplacingOccurrencesOfString("\n", withString: "")
        }
        
        
        if let date = date, team = team, location = location, time = time {
            return Chart(date: date, team: team, location: location, time: time)
        }
        return nil
    }
    
    private func isChartsTable(tableElement: HTMLElement) -> Bool {
        if tableElement.children.count > 0 {
            let firstChild = tableElement.childAtIndex(0)
            let lowerCaseContent = firstChild.textContent.lowercaseString
            if lowerCaseContent.containsString("date") && lowerCaseContent.containsString("team") && lowerCaseContent.containsString("opponent") {
                return true
            }
        }
        return false
    }
    
    func fetchCharts(completionHandler: (NSError?) -> Void) {
        Alamofire.request(.GET, URLString)
            .responseString { responseString in
                guard responseString.result.error == nil else {
                    completionHandler(responseString.result.error!)
                    return
                    
                }
                guard let htmlAsString = responseString.result.value else {
                    let error = Error.errorWithCode(.StringSerializationFailed, failureReason: "Could not get HTML as String")
                    completionHandler(error)
                    return
                }
                
                let doc = HTMLDocument(string: htmlAsString)
                
                // find the table of charts in the HTML
                let tables = doc.nodesMatchingSelector("tbody")
                var chartsTable:HTMLElement?
                for table in tables {
                    if let tableElement = table as? HTMLElement {
                        if self.isChartsTable(tableElement) {
                            chartsTable = tableElement
                            break
                        }
                    }
                }
                
                // make sure we found the table of charts
                guard let tableContents = chartsTable else {
                    // TODO: create error
                    let error = Error.errorWithCode(.DataSerializationFailed, failureReason: "Could not find charts table in HTML document")
                    completionHandler(error)
                    return
                }
                
                self.charts = []
                for row in tableContents.children {
                    if let rowElement = row as? HTMLElement { // TODO: should be able to combine this with loop above
                        if let newChart = self.parseHTMLRow(rowElement) {
                            self.charts?.append(newChart)
                        }
                    }
                }
                completionHandler(nil)
        }
    }
}