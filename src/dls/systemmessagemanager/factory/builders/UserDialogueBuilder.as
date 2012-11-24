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
	import dls.systemmessagemanager.messages.UserDialogueMessage;
	
	import flash.display.DisplayObject;
	
	/*
	* a class to build UserDialogueMessage's
	*/
	public class UserDialogueBuilder implements IMessageBuilder {
		
		public function canHandle(type:String):Boolean
		{
			return type == "dialogue";
		}
		
		public function handle(message:String, options:Object):IMessage
		{
			if (!(options.hasOwnProperty("confirmLabel") 
				&& typeof options.confirmLabel == "string" 
				&& options.hasOwnProperty("denyLabel")
				&& typeof options.denyLabel == "string")) 
			{
				throw new ArgumentError("options must have Strings in the 'confirmLabel' and 'denyLabel' properties.");
			}
			
			return new UserDialogueMessage(message, options.confirmLabel, options.denyLabel);
		}
	}
}