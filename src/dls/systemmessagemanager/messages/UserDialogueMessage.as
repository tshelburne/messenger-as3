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
	* a message to configure a user dialogue
	*/
	public class UserDialogueMessage implements IMessage {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		public function get type():String { return "dialogue"; }
		
		private var _message:String;
		public function get message():String { return _message; }
		
		private var _confirmLabel:String;
		public function get confirmLabel():String { return _confirmLabel; }
		
		private var _denyLabel:String;
		public function get denyLabel():String { return _denyLabel; }
		
		private var _dismiss:Signal = new Signal(); // dispatched from the view
		public function get dismiss():Signal { return _dismiss; }
		
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function UserDialogueMessage(aMessage:String, aConfirmLabel:String, aDenyLabel:String) {
			_message = aMessage;
			_confirmLabel = aConfirmLabel;
			_denyLabel = aDenyLabel;
		}
		
		public function init():void {
			
		}
	}
}