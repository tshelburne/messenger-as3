/*
* This file is part of the SystemMessageManager package.
*
* @author (c) Tim Shelburne <tim@dontlookstudios.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/
package dls.systemmessagemanager.messages {
	
	
	/*
	* a static class of valid values for the message type argument
	*/
	public class DefaultMessageType {
		
		public static const TIME_DISMISS:String = "time";
		public static const SIGNAL_DISMISS:String = "signal";
		public static const MULTISIGNAL_DISMISS:String = "multisignal";
		public static const USER_CONFIRM:String = "confirm";
		public static const USER_DIALOGUE:String = "dialogue";
		
	}
}