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
			if (!(options.hasOwnProperty("confirmButton") 
				&& options.confirmButton is DisplayObject 
				&& options.hasOwnProperty("denyButton") 
				&& options.denyButton is DisplayObject)) 
			{
				throw new ArgumentError("options must have DisplayObject's in the 'confirmButton' and 'denyButton' properties.");
			}
			
			return new UserDialogueMessage(message, options.confirmButton, options.denyButton);
		}
	}
}