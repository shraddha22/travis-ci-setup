@isTest 
public with sharing class validateClassA {
    static testMethod void validateUpdateTestField() {
       travis_test_obj__c b = new travis_test_obj__c();
       System.debug('Price before inserting new book: ' + b.test_field__c);
	   
	   b.test_field__c='Behind the Cloud';
       // Insert book
       insert b;
       
       travis_test_obj__c [] objs = new travis_test_obj__c [1];
       objs[0] = b;
       classA.updateTestField(objs);
    
       // Retrieve the new book
       b = [SELECT test_field__c FROM travis_test_obj__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.test_field__c);

       // Test that the trigger correctly updated the price
       System.assertEquals('Behind the Cloud', b.test_field__c);
    }
}