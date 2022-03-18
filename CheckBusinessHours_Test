@isTest
public class Bot_CheckBusinessHoursTest {
	
    static BusinessHours bh;
    
    @testSetup
    static void setup() {
		Bot_CheckBusinessHoursTest.bh = [SELECT Name from BusinessHours where isDefault = true];
    }
    
    static testMethod void checkBusinessHoursByName() {
        // Becase we can't insert our own BusinessHours object (DML prevented by SF), we can't reliably test that this
        // is correctly returning if we are or aren't within business hours. Best we can do is try load the default
        // and at least call some of the code
        List<String> input = new List<String>();
        if (Bot_CheckBusinessHoursTest.bh != null) {
            input.add(Bot_CheckBusinessHoursTest.bh.Name);
        }
        else {
	        input.add('default');
        }
        Boolean result = Bot_CheckBusinessHours.checkBusinessHoursByName(input)[0];
        System.assert(result, 'No results returned.');
    }
}
