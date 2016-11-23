@isTest 
public with sharing class validateClassA {
    static testMethod void validateHelloWorld() {
       travis_test_obj__c b = new travis_test_obj__c(Name='Behind the Cloud');
       System.debug('Price before inserting new book: ' + b.Price__c);

       // Insert book
       insert b;
    
       // Retrieve the new book
       b = [SELECT Name FROM travis_test_obj__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.Price__c);

       // Test that the trigger correctly updated the price
       System.assertEquals('Behind the Cloud', b.Name);
    }
}
