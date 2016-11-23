public with sharing class classA {
 public static void updateTestField(sf_adaptor__travis_test_obj__c[] objs) {
   for (sf_adaptor__travis_test_obj__c b :objs){
      b.sf_adaptor__test_field__c = b.sf_adaptor__test_field__c  + 'test';
   }
  }    
}