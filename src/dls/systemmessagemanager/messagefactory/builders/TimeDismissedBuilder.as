/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messagefactory.builders {
	
	import dls.systemmessagemanager.messages.IMessage;
	import dls.systemmessagemanager.messages.TimeDismissedMessage;
	
	
	/*
	* a class to build TimeDismissedMessage's
	*/
	public class TimeDismissedBuilder implements IMessageBuilder {
		
		public function canHandle(type:String):Boolean {
			return type == "time";
		}
		
		public function handle(message:String, options:Object):IMessage {
			if (!options.hasOwnProperty("timeToDisplay") || !(typeof options.timeToDisplay == "number")) {
				throw new ArgumentError("options must have a number in the 'timeToDisplay' property.");
			}
			
			return new TimeDismissedMessage(message, options.timeToDisplay);
		}
	}
}