public with sharing class classB {
	public static void HelloWorld(Account a) {
	 System.debug('Hello.....!!!!');
	 a.Name = 'test'  + a.Name;
	}    
}