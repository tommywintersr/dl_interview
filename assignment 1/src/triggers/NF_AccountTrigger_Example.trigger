/**
* @File Name:	NF_AccountTrigger_Example.trigger
* @Description: A trigger that adds a corresponding Contact for each new account
* @Author:   	Thomas Winter
* @Group:   	Trigger
* @Modification Log	:
*-------------------------------------------------------------------------------------
* Ver       Date        Author      Modification
* 1.0       2018-03-25  Thomas Winter    Created the file/class
*/
trigger NF_AccountTrigger_Example on Account (
	before insert,
	before update,
	before delete,
	after insert,
	after update,
	after delete,
	after undelete) {
	NF_TriggerFactory.CreateHandlerAndExecute(Account.sObjectType);

	//Create a corresponding contact when a new Account is inserted
	if (Trigger.isInsert) {
				if (Trigger.isAfter) {
            // Process after insert log
						System.debug('Account Trigger: New insert, creating corresponding Contact object.');

						//Create a list to hold new contacts
						List<Contact> contactList = new List<Contact>();

						for(Account a : Trigger.New){
							//Create Contact and set LastName to Account.Name field
							contactList.add(new Contact(LastName=a.Name));
							System.debug('Added Contact: ' + a.Name + '.');
						}

						//insert list
						if (contactList.size() > 0) {
        			insert contactList;
    				}

        }
    }
}
