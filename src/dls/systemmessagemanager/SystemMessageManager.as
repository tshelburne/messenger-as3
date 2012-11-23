/*
* This file is part of the SystemMessagemanager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager {
	
	import dls.systemmessagemanager.ISystemMessageManager;
	import dls.systemmessagemanager.messagefactory.IMessageFactory;
	import dls.systemmessagemanager.messages.IMessage;
	
	import org.osflash.signals.Signal;
	
	/*
	* a class to handle queueing and circulating system messages for display
	*/
	public class SystemMessageManager implements ISystemMessageManager {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		private var _messageFactory:IMessageFactory;
		
		private var _currentMessage:IMessage = null;
		
		private var _messages:Vector.<IMessage> = new <IMessage>[];
		public function get messages():Vector.<IMessage> { return _messages; }
		
		private var _displayMessage:Signal = new Signal();
		public function get displayMessage():Signal { return _displayMessage; }
		
		private var _closeMessage:Signal = new Signal();
		public function get closeMessage():Signal { return _closeMessage; }
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function SystemMessageManager(messageFactory:IMessageFactory) {
			_messageFactory = messageFactory;
		}
		
		/**
		 * adds a message to the end of the queue
		 */
		public function queueMessage(type:String, message:String, options:Object):void {
			queueMessageAt(type, message, options, _messages.length);
		}
		
		/**
		 * adds a message to the queue in the position specified
		 */
		public function queueMessageAt(type:String, message:String, options:Object, index:uint):void {
			var newMessage:IMessage = _messageFactory.build(type, message, options);
			_messages.splice(index, 0, newMessage);
			newMessage.dismiss.add(cueNextMessage);
			
			if (_currentMessage == null) {
				_currentMessage = newMessage;
				_displayMessage.dispatch(_currentMessage);
			}
		}
		
		/**
		 * removes a message from the queue
		 */
		public function removeMessage(message:IMessage):void {
			_messages.splice(_messages.indexOf(message), 1);
		}
		
		/**
		 * cycles to the next message to be displayed
		 */
		private function cueNextMessage():void {
			_closeMessage.dispatch(_currentMessage);
			removeMessage(_currentMessage);
			
			if (_messages.length > 0) {
				_currentMessage = _messages[0];
				_displayMessage.dispatch(_currentMessage);
			}
			else {
				_currentMessage = null;
			}
		}
	}
}