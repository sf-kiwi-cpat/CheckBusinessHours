global class CheckBusinessHours {
    
	global static Boolean checkBusinessHoursById(String requestId)
    	{
		Boolean isWithin = false;
		if (requestId != null)
		{
			// Making use of BusinessHours Apex method
			// Check out this page for more details: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_businesshours.htm
		    isWithin = BusinessHours.isWithin(requestId, System.now());
		}

		return isWithin;
    	}

    	@InvocableMethod(label='Check Now is within Business Hours by Name')
	global static List<Boolean> checkBusinessHoursByName(List<String> requestNames)
    	{
		List<Boolean> results = new List<Boolean>();

		for(String name : requestNames) {
			// Look up the Business hours by name to find the ID
		    List<BusinessHours> businessHours = [SELECT Id FROM BusinessHours where Name =:name AND IsActive = true];
		    if (businessHours.size() == 1) {
			    // Call method to check if now is within business hours based on the found hours
			results.add(CheckBusinessHours.checkBusinessHoursById(businessHours[0].Id));
		    }
		    else
		    {
			    // If name didn't match an active business hours then return false.
			results.add(false);
		    }
		}
		return results;
    	}

}
