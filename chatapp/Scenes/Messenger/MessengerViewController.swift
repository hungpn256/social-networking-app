//
//  MessengerViewController.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import UIKit

class MessengerViewController: UIViewController {

    @IBOutlet weak var tbvMessenger: UITableView!
    
    let viewModel = MessengerViewModel()
    var conversations: [Conversation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        APISocket.shared.establishConnection()
        // Do any additional setup after loading the view.
        initUI()
        initData()
    }
    
    func initData(){
        viewModel.getConversation(updatedAt: nil)
        viewModel.conversations.observe(on: self) {[weak self] newConversations in
            self?.conversations = newConversations
            self?.tbvMessenger.reloadData()
        }
    }
    
    func initUI(){
        tbvMessenger.delegate = self
        tbvMessenger.dataSource = self
        tbvMessenger.registerNib(MessengerTableViewCell.self)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MessengerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvMessenger.dequeueReusableCell(MessengerTableViewCell.self, for: indexPath)
        let conversation = self.conversations[indexPath.row]
        cell?.configCell(conversation.participants.first?.user.avatar ?? "", conversation.participants.first?.user.fullName ?? "", conversation.messages.first?.content ?? "", conversation.messages.first?.createdAt ?? "")
        return cell ?? UITableViewCell()
    }
}
