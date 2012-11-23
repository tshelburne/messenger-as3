/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messages {

	import org.osflash.signals.Signal;
	
	public interface IMessage {
		
		function get message():String;
		
		function get dismiss():Signal;
		
		function init():void;
		
	}
}