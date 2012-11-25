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
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	/*
	* a message to be dismissed on the dispatch of the given signal
	*/
	public class SignalDismissedMessage implements IMessage {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		public function get type():String { return "signal"; }
		
		private var _message:String;
		public function get message():String { return _message; }
		
		private var _signal:ISignal;
		
		private var _dismiss:Signal = new Signal();
		public function get dismiss():Signal { return _dismiss; }
		
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function SignalDismissedMessage(aMessage:String, signal:ISignal) {
			_message = aMessage;
			_signal = signal;
		}
		
		public function init():void {
			_signal.addOnce(dismissMessage);
		}
		
		/**
		 * first argument handles NativeSignal requests
		 */
		private function dismissMessage(arg1:* = null, ... rest):void {
			_signal.remove(dismissMessage);
			_dismiss.dispatch(this);
		}
	}
}