/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.displaymanager {
	
	import dls.debugger.Debug;
	import dls.systemmessagemanager.displaymanager.views.IMessageView;
	import dls.systemmessagemanager.messages.IMessage;
	
	import flash.display.DisplayObject;
	
	
	/*
	* a class to facilitate selecting a message display
	*/
	public class DisplayManager implements IDisplayManager {
		
		/*=========================================================*
		* PROPERTIES
		*=========================================================*/
		
		private var _debugOptions:Object = { "source" : "SystemMessageManager (DisplayManager)" };
		
		private var _messageDisplays:Vector.<IMessageView>;
		
		/*=========================================================*
		* FUNCTIONS
		*=========================================================*/
		
		public function DisplayManager(messageDisplays:Vector.<IMessageView>) {
			_messageDisplays = messageDisplays;
		}
		
		public function createView(message:IMessage):DisplayObject {
			Debug.out("Creating view for '" + message.type + "' message...", Debug.DETAILS, _debugOptions);
			for each (var messageDisplay:IMessageView in _messageDisplays) {
				if (messageDisplay.canHandle(message.type)) {
					return messageDisplay.createView(message);
				}
			}
			
			return null;
		}
	}
}