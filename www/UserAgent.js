var exec = require('cordova/exec');

const PluginName = 'UserAgent';

module.exports = {
    set: function (text) {
        return new Promise(function (resolve, reject) {
            exec(resolve, reject, PluginName, 'set', [text]);
        });
    },
    get: function () {
        return new Promise(function (resolve, reject) {
            exec(resolve, reject, PluginName, 'get', []);
        });
    },
    reset: function () {
        return new Promise(function (resolve, reject) {
            exec(resolve, reject, PluginName, 'reset', []);
        });
    }
};