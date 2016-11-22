public with sharing class classA {
 public static void applyDiscount(Book__c[] books) {
   for (Book__ b :books){
      b.Price__c *= 0.9;
   }
  }    
}