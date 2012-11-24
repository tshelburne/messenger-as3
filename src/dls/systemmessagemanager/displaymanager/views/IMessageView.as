/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.displaymanager.views {
	
	import dls.systemmessagemanager.messages.IMessage;
	
	import flash.display.DisplayObject;
	
	public interface IMessageView {

		function canHandle(type:String):Boolean;
		
		function createView(message:IMessage):DisplayObject;
		
	}
}