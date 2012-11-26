/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messages {
	
	import dls.systemmessagemanager.messages.IMessage;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	/*
	* a message to configure a user dialogue
	*/
	public class UserDialogueMessage extends UserConfirmMessage {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		override public function get type():String { return "dialogue"; }
		
		private var _denyLabel:String;
		public function get denyLabel():String { return _denyLabel; }
		
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function UserDialogueMessage(aMessage:String, aConfirmLabel:String, aDenyLabel:String) {
			super(aMessage, aConfirmLabel);
			_denyLabel = aDenyLabel;
		}
	}
}