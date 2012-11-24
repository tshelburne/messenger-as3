/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.factory {
	
	import dls.systemmessagemanager.messages.IMessage;
	
	public interface IMessageFactory {
		
		function build(type:String, message:String, options:Object):IMessage;
		
	}
}