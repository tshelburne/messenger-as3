/*
* This file is part of the package package.
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
	* ASDOC
	*/
	public class MultiSignalDismissedMessage implements IMessage {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		public function get type():String { return "multisignal"; }
		
		private var _message:String;
		public function get message():String { return _message; }
		
		private var _signals:Vector.<ISignal>;
		
		private var _dismiss:Signal = new Signal;
		public function get dismiss():Signal { return _dismiss; }
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function MultiSignalDismissedMessage(aMessage:String, signals:Vector.<ISignal>) {
			_message = aMessage;
			_signals = signals;
		}
		
		public function init():void {
			for each (var signal:ISignal in _signals) {
				signal.add(dismissMessage);
			}
		}
		
		/**
		 * first argument handles NativeSignal requests
		 */
		private function dismissMessage(arg1:* = null, ... rest):void {
			for each (var signal:ISignal in _signals) {
				signal.remove(dismissMessage);
			}
			_dismiss.dispatch(this);
		}
	}
}