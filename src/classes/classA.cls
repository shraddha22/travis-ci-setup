public with sharing class classA {
 public static void updateTestField(travis_test_obj__c[] objs) {
   for (travis_test_obj__c b :objs){
      b.test_field__c = b.test_field__c  + 'test';
   }
  }    
}