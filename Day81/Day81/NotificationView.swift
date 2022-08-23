//
//  NotificationView.swift
//  Day81
//
//  Created by home on 23/08/22.
//

import SwiftUI
import UserNotifications

struct NotificationView: View {
    var body: some View {
        VStack{
            Button("Request Permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound ]) { success, error in
                    
                    
                    
                    if success{
                        print("All set")
                    }else if let error = error  {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification"){
                let content = UNMutableNotificationContent()
                content.title = "Ve al bano"
                content.subtitle = "se necesita"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
