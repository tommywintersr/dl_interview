/*
Author: Thomas Winter
Date: March 26, 2018
Description:
Controller to handle button clicks within custom lightning component.
Clickhandlers show/hide modal, and give feedback to main component on which button was clicked.

*/

({
    //component button onClick handler
    showModal : function(component, event, helper) {
        document.getElementById("modal-div").style.display = "block";
        document.getElementById("confirm-msg").style.display = "none";
        document.getElementById("cancel-msg").style.display = "none";
    },

    //close/X button
    hideModal : function(component,event, helper){
       document.getElementById("modal-div").style.display = "none";
   	},

    //modal cancel button
   	cancelModal : function(component,event, helper){
       document.getElementById("modal-div").style.display = "none";
       document.getElementById("cancel-msg").style.display = "block";
       document.getElementById("cancel-msg").class ="slds-align_absolute-center";
   	},
    //modal confirm button
    confirmModal : function(component,event, helper){
       document.getElementById("modal-div").style.display = "none";
       document.getElementById("confirm-msg").style.display = "block";
   	}
})
