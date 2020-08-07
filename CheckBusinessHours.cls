global class CheckBusinessHours {
    
	//@InvocableMethod(label='Check Business Hours by Id')
	global static Boolean checkBusinessHoursById(String requestId)
    {
        //List<Boolean> results = new List<Boolean>();
        Boolean isWithin = false;
        if (requestId != null)
        {
            isWithin = BusinessHours.isWithin(requestId, System.now());
        }
        
        return isWithin;
    }
    
    @InvocableMethod(label='Check Business Hours by Name')
	global static List<Boolean> checkBusinessHoursByName(List<String> requestNames)
    {
        List<Boolean> results = new List<Boolean>();
        
        for(String name : requestNames) {
            List<BusinessHours> businessHours = [SELECT Id FROM BusinessHours where Name =:name AND IsActive = true];
            if (businessHours.size() == 1) {
                results.add(BotCheckBusinessHours.checkBusinessHoursById(businessHours[0].Id));
            }
            else
            {
                results.add(false);
            }
        }
    
        return results;
    }
    
}
