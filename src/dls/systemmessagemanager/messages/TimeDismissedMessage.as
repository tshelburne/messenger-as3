/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messages {
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	/*
	* a time-dismissed message
	*/
	public class TimeDismissedMessage implements IMessage {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		private var _message:String;
		public function get message():String { return _message; }
		
		private var _timer:Timer;
		
		private var _dismiss:Signal = new Signal();
		public function get dismiss():Signal { return _dismiss; }
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function TimeDismissedMessage(aMessage:String, timeToDismiss:uint) {
			_message = aMessage;
			_timer = new Timer(timeToDismiss, 1);
		}
		
		public function init():void {
			new NativeSignal(_timer, TimerEvent.TIMER, TimerEvent).addOnce(dismissMessage);
			_timer.start();
		}
		
		private function dismissMessage():void {
			_dismiss.dispatch();
		}
	}
}