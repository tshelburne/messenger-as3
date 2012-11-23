/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messagefactory.builders {
	
	import dls.systemmessagemanager.messagefactory.builders.IMessageBuilder;
	import dls.systemmessagemanager.messages.IMessage;
	import dls.systemmessagemanager.messages.SignalDismissedMessage;
	
	import org.osflash.signals.ISignal;
	
	/*
	* a class to build SignalDismissedMessage's
	*/
	public class SignalDismissedBuilder implements IMessageBuilder {
		
		public function canHandle(type:String):Boolean {
			return type == "signal";
		}
		
		public function handle(message:String, options:Object):IMessage {
			if (!options.hasOwnProperty("signal") || !(options.signal is ISignal)) {
				throw new ArgumentError("options must have an ISignal in the 'signal' property.");
			}
			
			return new SignalDismissedMessage(message, options.signal as ISignal);
		}
	}
}