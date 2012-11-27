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
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
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
		
		
		private var _timer:Timer;
		private var _timerFinished:Boolean = false;
		
		private var _signals:Vector.<ISignal>;
		private var _signalFinished:Boolean = false;
		
		private var _dismiss:Signal = new Signal;
		public function get dismiss():Signal { return _dismiss; }
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function MultiSignalDismissedMessage(aMessage:String, signals:Vector.<ISignal>, minTimeToShow:uint = 0) {
			_message = aMessage;
			_signals = signals;
			_timer = new Timer(minTimeToShow, 1);
		}
		
		/**
		 * initialize both the timer and the signal listeners
		 */
		public function init():void {
			for each (var signal:ISignal in _signals) {
				signal.add(signalReceived);
			}
			
			new NativeSignal(_timer, TimerEvent.TIMER, TimerEvent).addOnce(timerFinished);
			_timer.start();
		}
		
		/**
		 * react to the timer finishing
		 */
		protected function timerFinished(e:TimerEvent):void {
			_timerFinished = true;
			
			if (_signalFinished) {
				_dismiss.dispatch(this);
			}
		}
		
		/**
		 * first argument handles NativeSignal requests
		 */
		private function signalReceived(arg1:* = null, ... rest):void {
			_signalFinished = true;
			
			if (_timerFinished) {
				for each (var signal:ISignal in _signals) {
					signal.remove(signalReceived);
				}
				_dismiss.dispatch(this);
			}
		}
	}
}