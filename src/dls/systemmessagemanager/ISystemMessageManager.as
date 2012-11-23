/*
* This file is part of the SystemMessagemanager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager {
	
	import dls.systemmessagemanager.messages.IMessage;
	
	import org.osflash.signals.Signal;
	
	public interface ISystemMessageManager {
		
		function get displayMessage():Signal;
		
		function get closeMessage():Signal;
		
		function queueMessage(type:String, message:String, options:Object):void;
		
		function queueMessageAt(type:String, message:String, options:Object, index:uint):void;
		
		function removeMessage(message:IMessage):void;
	}
}