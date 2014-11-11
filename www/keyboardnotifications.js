cordova.define("uk.ac.open.ouanywhere.keyboardnotifications", function(require, exports, module) {

	var argscheck = require('cordova/argscheck'),
	    channel = require('cordova/channel'),
	    utils = require('cordova/utils'),
	    exec = require('cordova/exec'),
	    cordova = require('cordova');
	
	KeyboardNotifications.prototype.registerForKeyboardNotifications = function(successCallback, errorCallback) {
	    exec(successCallback, errorCallback, "KeyboardNotifications", "registerForKeyboardNotifications", []);
	};
	
	KeyboardNotifications.prototype.UIKeyboardDidShowNotification = function(successCallback, errorCallback) {
	    exec(successCallback, errorCallback, "KeyboardNotifications", "UIKeyboardDidShowNotification", []);
	};
	
	KeyboardNotifications.prototype.keyboardDidHide = function(successCallback, errorCallback) {
	    exec(successCallback, errorCallback, "KeyboardNotifications", "keyboardDidHide", []);
	};
	
	module.exports = new KeyboardNotifications();

}
