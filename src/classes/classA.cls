public with sharing class classA {
 public static void applyDiscount(Book__c[] books) {
   //test comment
   for (Book__c b :books){
      b.Price__c *= 0.9;
   }
  }    
}