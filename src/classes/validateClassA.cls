@isTest 
public with sharing class validateClassA {
    static testMethod void validateHelloWorld() {
       sf_adaptor__travis_test_obj__c b = new sf_adaptor__travis_test_obj__c();
       System.debug('Price before inserting new book: ' + b.sf_adaptor__test_field__c);
	   
	   b.sf_adaptor__test_field__c='Behind the Cloud';
       // Insert book
       insert b;
    
       // Retrieve the new book
       b = [SELECT sf_adaptor__test_field__c FROM sf_adaptor__travis_test_obj__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.sf_adaptor__test_field__c);

       // Test that the trigger correctly updated the price
       System.assertEquals('Behind the Cloud', b.sf_adaptor__test_field__c);
    }
}
