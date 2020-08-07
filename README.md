# CheckBusinessHours

This code is for checking whether the current time is within Business Hours or not. It's intended use is from an Einstein Bot when using Chat, which can take the boolean response and send a different message, or attempt to transfer to an agent or not based on the response. Note that for the Messaging channels (e.g. SMS), you can use the OOB setup to set Business Hours on the Messaging Channel, which the bot will then check before transferring to an agent - no need for this code.

The request takes in the 'Business Hours' Name field - you can find this by going to 'Setup --> Business Hours', and the 'Name' will be shown in the list displayed on that admin screen in the 'Business Hours Name' column.

Make sure after creating and adding this code to your Org, that you give your bot permission to acces it. You can then call it from an 'Action' element and pass in the name you have found above (you need to change the 'Source' drop down from 'Variable' to 'Value', then type in the name).


Please upvote this idea to gain momentum for it to be added to the product: https://trailblazer.salesforce.com/ideaView?id=08730000000Dk59AAC (this idea doesn't mention a bot, but is related to having chat offered to agents only during certain hours).
