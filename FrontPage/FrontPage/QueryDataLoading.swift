// Copyright (c) 2016 Meteor Development Group, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import Apollo

protocol QueryDataLoading {
  associatedtype Query: GraphQLQuery
  
  var query: Query { get }
  
  func dataDidLoad(data: Query.Data)
}

extension QueryDataLoading {
  func loadData() {
    client.fetch(query: query) { (result, error) in
      if let error = error { NSLog("Error while fetching query: \(error.localizedDescription)");  return }
      guard let result = result else { NSLog("No query result");  return }
      
      if let errors = result.errors {
        NSLog("Errors in query result: \(errors)")
      }
      
      guard let data = result.data else { NSLog("No query result data");  return }
      
      // Dispatch to the main thread for UI updates
      DispatchQueue.main.async {
        self.dataDidLoad(data: data)
      }
    }
  }
}

extension QueryDataLoading where Self: UIViewController {
}
