@isTest 
public with sharing class validateClassA {
    static testMethod void validateHelloWorld() {
       sf_adaptor__travis_test_obj__c b = new sf_adaptor__travis_test_obj__c(Name='Behind the Cloud');
       System.debug('Price before inserting new book: ' + b.Name);

       // Insert book
       insert b;
    
       // Retrieve the new book
       b = [SELECT Name FROM sf_adaptor__travis_test_obj__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.Name);

       // Test that the trigger correctly updated the price
       System.assertEquals('Behind the Cloud', b.Name);
    }
}
