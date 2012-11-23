/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messages {
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	/*
	* ASDOC
	*/
	public class UserDialogueMessage implements IMessage {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		private var _message:String;
		public function get message():String { return _message; }
		
		private var _confirmButton:Sprite;
		
		private var _denyButton:Sprite;
		
		private var _dismiss:Signal = new Signal();
		public function get dismiss():Signal { return _dismiss; }
		
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function UserDialogueMessage(aMessage:String, confirmButton:Sprite, denyButton:Sprite) {
			_message = aMessage;
			_confirmButton = confirmButton;
			_denyButton = denyButton;
		}
		
		public function init():void {
			
		}
	}
}