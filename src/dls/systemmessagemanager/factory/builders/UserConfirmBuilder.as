/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.factory.builders {
	
	import dls.systemmessagemanager.messages.IMessage;
	import dls.systemmessagemanager.messages.UserConfirmMessage;
	
	import flash.display.DisplayObject;
	
	/*
	* a class to build UserConfirmMessage's
	*/
	public class UserConfirmBuilder implements IMessageBuilder {
		
		public function canHandle(type:String):Boolean {
			return type == "confirm";
		}
		
		public function handle(message:String, options:Object):IMessage {
			if (!options.hasOwnProperty("confirmLabel") || !(typeof options.confirmLabel == "string")) {
				throw new ArgumentError("options must have a String in the 'confirmLabel' property.");
			}
			
			return new UserConfirmMessage(message, options.confirmLabel);
		}
	}
}