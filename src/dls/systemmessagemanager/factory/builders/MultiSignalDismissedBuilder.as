/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.factory.builders {
	
	import dls.systemmessagemanager.messages.IMessage;
	import dls.systemmessagemanager.messages.MultiSignalDismissedMessage;
	
	import org.osflash.signals.ISignal;
	
	/*
	* a class to build MultiSignalDismissedMessage's
	*/
	public class MultiSignalDismissedBuilder implements IMessageBuilder {
		
		public function canHandle(type:String):Boolean {
			return type == "multisignal";
		}
		
		public function handle(message:String, options:Object):IMessage {
			if (!options.hasOwnProperty("signals") || !(options.signals is Vector.<ISignal>)) {
				throw new ArgumentError("options must have a Vector.<ISignal> in the 'signals' property.");
			}
			
			var minTimeToDismiss:uint = options.hasOwnProperty("minTimeToDismiss") ? options.minTimeToDismiss : 0;
			
			return new MultiSignalDismissedMessage(message, options.signals as Vector.<ISignal>, minTimeToDismiss);
		}
	}
}