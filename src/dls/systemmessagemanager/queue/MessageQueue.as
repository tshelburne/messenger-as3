/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.queue {
	
	import dls.systemmessagemanager.messages.IMessage;
	
	import org.osflash.signals.Signal;
	
	
	/*
	* a class to handle moving messages through the queue
	*/
	public class MessageQueue implements IMessageQueue {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		private var _messages:Vector.<IMessage> = new <IMessage>[];
		
		private var _queued:Signal = new Signal();
		public function get queued():Signal { return _queued; }
		
		private var _display:Signal = new Signal();
		public function get display():Signal { return _display; }
		
		private var _dismissed:Signal = new Signal();
		public function get dismissed():Signal { return _dismissed; }
		
		private var _removed:Signal = new Signal();
		public function get removed():Signal { return _removed; }
		
		private var _finished:Signal = new Signal();
		public function get finished():Signal { return _finished; }
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function add(message:IMessage):void {
			addAt(message, _messages.length);
		}
		
		public function addAt(message:IMessage, index:uint):void {
			_messages.splice(index, 0, message);
			_queued.dispatch(message);
			
			if (_messages.length == 0) {
				message.dismiss.add(messageDismissed);
				_display.dispatch(message);
			}
		}
		
		public function remove(message:IMessage):void {
			_messages.splice(_messages.indexOf(message), 1);
			_removed.dispatch(message);
		}
		
		private function messageDismissed(message:IMessage):void {
			_dismissed.dispatch(message);
			remove(message);
			
			if (_messages.length > 0) {
				_messages[0].dismiss.add(messageDismissed);
				_display.dispatch(_messages[0]);
			}
			else {
				_finished.dispatch();
			}
		}
	}
}