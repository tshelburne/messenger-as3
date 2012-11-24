/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.queue {
	
	import dls.systemmessagemanager.messages.IMessage;
	
	import org.osflash.signals.Signal;
	
	public interface IMessageQueue {
		
		function get queued():Signal;
		
		function get display():Signal;
		
		function get dismissed():Signal;
		
		function get removed():Signal;
		
		function get finished():Signal;
		
		function add(message:IMessage):void;
		
		function addAt(message:IMessage, index:uint):void;
		
		function remove(message:IMessage):void;
		
	}
}