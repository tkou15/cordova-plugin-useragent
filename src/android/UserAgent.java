package tkou15.cordova.UserAgent;

import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;

import android.webkit.WebSettings;
import android.webkit.WebView;

import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;

public class UserAgent extends ReflectiveCordovaPlugin {

    public WebSettings settings;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        try {
            settings = ((WebView) webView.getEngine().getView()).getSettings();
        } catch (Exception error) {
            settings = null;
        }
    }

    @CordovaMethod
    private void set(String text, CallbackContext callbackContext) {
        settings.setUserAgentString(text);
        callbackContext.success(settings.getUserAgentString());
    }

    @CordovaMethod
    private void get(CallbackContext callbackContext) {
        callbackContext.success(settings.getUserAgentString());
    }

    @CordovaMethod
    private void reset(CallbackContext callbackContext) {
        settings.setUserAgentString(null);
        callbackContext.success(settings.getUserAgentString());
    }
}
