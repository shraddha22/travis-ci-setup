@isTest
public with sharing class validateHelloWorld {
	  static testMethod void validateHelloWorld() {
	  	Account a = new Account(Name = 'account');
		classB.HelloWorld(a);
		System.assertEquals('testaccount', a.Name);
    }
    
}