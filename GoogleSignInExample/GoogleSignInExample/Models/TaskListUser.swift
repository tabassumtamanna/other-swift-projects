//
//  TaskListUser.swift
//  GoogleSignInExample
//
//  Created by Tabassum Tamanna on 5/6/21.
//

import Foundation
import Firebase
import GoogleSignIn

// MARK: - TodoListUser
class TodoListUser {
    
    struct TodoAuth {
        
        
        static var user: User?
    }
    
    enum TodoList {
        static let TodoListTable = "TodoList"
        static let usersTable = "Users"
        
    }
    
    enum Endpoints{
        
        static let base = "https://tasks.googleapis.com/tasks/v1/users"
        
        case getAuth
        case getTaskListFromApi
        case insertTasklists(String)
        case uploadMyTask
        
        var stringValue: String{
            switch self{
            
            case .getAuth:
                return "https://accounts.google.com/o/oauth2/v2/auth?response_type=code&scope=https://www.googleapis.com/auth/tasks&redirect_uri=http://localhost/oauth2callback&client_id=" + (FirebaseApp.app()?.options.clientID)!
            
            case .getTaskListFromApi:
                return Endpoints.base + "/\(TodoAuth.user?.uid)/lists?key=AIzaSyAJPus5nQYDg0eM06WSI1vRoAm7S08tHVA"
            
            case .insertTasklists(let userId):
                return Endpoints.base + "/\(userId)/lists?key=AIzaSyAJPus5nQYDg0eM06WSI1vRoAm7S08tHVA"
                
            case .uploadMyTask:
                return Endpoints.base + ""
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    // MARK: - Task For GET Request
    @discardableResult class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionTask {
       
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
        return task
    }
    
    // MARK: - Task For Post Request
    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: RequestType,  completion: @escaping (ResponseType?, Error?) -> Void){
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(body)
        
        let encoder = JSONEncoder()
        if let json = try? encoder.encode(body) {
            print(String(data: json, encoding: .utf8)!)
        }
        
        let task = URLSession.shared.dataTask(with: request)  {(data, response, error) in
           
            guard let data = data else {
               
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            var newData = data
            let docoder = JSONDecoder()
           
            do {
                let requestObject = try docoder.decode(ResponseType.self, from: newData)
               
                DispatchQueue.main.async {
                    completion(requestObject, nil)
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
        
    }
    
    // MARK: -  Google API
    
    class func getAuth(){
        
        
    }
    
    class func getTaskListFromApi(){
        
        
    }
    
    
    
}

