/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.factory {
	
	import dls.debugger.Debug;
	import dls.systemmessagemanager.factory.builders.IMessageBuilder;
	import dls.systemmessagemanager.factory.builders.MultiSignalDismissedBuilder;
	import dls.systemmessagemanager.factory.builders.SignalDismissedBuilder;
	import dls.systemmessagemanager.factory.builders.TimeDismissedBuilder;
	import dls.systemmessagemanager.factory.builders.UserConfirmBuilder;
	import dls.systemmessagemanager.factory.builders.UserDialogueBuilder;
	import dls.systemmessagemanager.messages.IMessage;
	
	/*
	* a factory class to build messages that match a set of rules given by a list of builders
	*/
	public class MessageFactory implements IMessageFactory {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		private var _debugOptions:Object = { "source" : "SystemMessageManager (MessageFactory)" };
		
		private var _builders:Vector.<IMessageBuilder>;
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function MessageFactory(builders:Vector.<IMessageBuilder> = null) {
			var defaultBuilders:Vector.<IMessageBuilder> = new <IMessageBuilder>[
				new TimeDismissedBuilder(),
				new SignalDismissedBuilder(),
				new MultiSignalDismissedBuilder(),
				new UserConfirmBuilder(),
				new UserDialogueBuilder()
			];
			
			_builders = builders == null ? defaultBuilders : builders.concat(defaultBuilders);
		}
		
		public function build(type:String, message:String, options:Object):IMessage {
			Debug.out("Building '" + type + "' message...", Debug.DETAILS, _debugOptions);
			for each (var builder:IMessageBuilder in _builders) {
				if (builder.canHandle(type)) {
					return builder.handle(message, options);
				}
			}
			
			return null;
		}
	}
}