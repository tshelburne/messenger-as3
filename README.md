System Message Manager
======================

This is a library to enable system messaging and automatic handling of message dismissing. It is intended to be used in conjunction with some sort of generalized graphical interface within the project. 

Features
--------

The following classes / components are included:

* SystemMessageManager (dls.systemmessagemanager.SystemMessageManager) -- A basic message handling class to handle queueing messages and signaling when a view should be displayed.
* IMessage (dls.systemmessagemanager.messages.IMessage) -- An interface whose implementations represent a basic system message, dismissible by its dismiss Signal property. 
* DefaultMessageType (dls.systemmessagemanager.messages.DefaultMessageType) -- A static class that contains references to the string representations of the default message types provided by this library.
* MessageFactory (dls.systemmessagemanager.factory.MessageFactory) -- A factory to return messages built from the list of injected IMessageBuilders.
* MessageQueue (dls.systemmessagemanager.queue.MessageQueue) -- A container for messages queued up by the SystemMessageManager, with signals that relay where in the process of messaging a given IMessage is.
* DisplayManager (dls.systemmessagemanager.displaymanager.DisplayManager) -- A factory to return the view for a given message.
* IMessageView (dls.systemmessagemanager.displaymanager.views.IMessageView) -- An interface whose implementations represent a view tied to a system message - in order to display a system message added to the MessageFactory, an IMessageView responding to the same type must be added to the DisplayManager.


Usage
-----

Import the necessary classes:

    import dls.systemmessagemanager.SystemMessageManager;
    import dls.systemmessagemanager.displaymanager.DisplayManager;
    import dls.systemmessagemanager.displaymanager.views.IMessageView;
    import dls.systemmessagemanager.factory.MessageFactory;
    import dls.systemmessagemanager.queue.MessageQueue;
    
    import my.project.namespace.TimeDismissedMessageView;
    import my.project.namespace.SignalDismissedMessageView;
    import my.project.namespace.MultiSignalDismissedMessageView;
    import my.project.namespace.UserConfirmMessageView;
    import my.project.namespace.UserDialogueMessageView;

Initialize the SystemMessageManager:

    var messageQueue:MessageQueue = new MessageQueue();
    var messageFactory:MessageFactory = new MessageFactory();
    var displayManager:DisplayManager = new DisplayManager(new <IMessageView>[
      new TimeDismissedMessageView(),
      new SignalDismissedMessageView(),
      new MultiSignalDismissedMessageView(),
      new UserConfirmMessageView(),
      new UserDialogueMessageView()
    ]);
    var systemMessageManager:SystemMessageManager = new SystemMessageManager(messageQueue, messageFactory, displayManager);

    systemMessageManager.displayView.add(displayFunction);
    systemMessageManager.clearView.add(clearFunction);
    
    function displayFunction(content:DisplayObject):void {
      // display content here
    }
    
    function clearFunction():void {
       // react to messages being hidden here
    }

Queue and display a message:

    systemMessageManager.queueMessage(DefaultMessageType.USER_CONFIRM, "There was an error with your request.", { "confirmLabel":"OK" });
    systemMessageManager.queueMessage(DefaultMessageType.TIME, "Processing your request…", { "timeToDisplay":2000 });