@isTest
public with sharing class validateHelloWorld {
	  static testMethod void validateHelloWorld() {
	  	Account a = new Account(Name = 'account');
	  	insert a;
		classB.HelloWorld(a);
		System.assertEquals('testaccount', a.Name);
    }
    
}