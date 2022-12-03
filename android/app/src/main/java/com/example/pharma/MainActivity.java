package com.example.pharma;

import datamodels.PWEStaticDataModel;
import io.flutter.embedding.android.FlutterActivity;

import android.content.Intent;
import android.os.Bundle;

import com.easebuzz.payment.kit.PWECouponsActivity;
import com.google.gson.Gson;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "easebuzz";
    MethodChannel.Result channel_result;
    private boolean start_payment = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//      GeneratedPluginRegistrant.registerWith();
        start_payment = true;

        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        channel_result = result;
                        if (call.method.equals("payWithEasebuzz")) {
                            if (start_payment) {
                                start_payment = false;
                                startPayment(call.arguments);
                            }
                        }
                    }
                });
    }
    private void startPayment(Object arguments) {
        try {
            Gson gson = new Gson();
            JSONObject parameters = new JSONObject(gson.toJson(arguments));
            Intent intentProceed = new Intent(getBaseContext(), PWECouponsActivity.class);
            intentProceed.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            intentProceed.putExtra("access_key",parameters.getString("access_key"));
            intentProceed.putExtra("pay_mode",parameters.getString("pay_mode"));
            startActivityForResult(intentProceed, PWEStaticDataModel.PWE_REQUEST_CODE);
        }catch (Exception e) {
            start_payment=true;
            Map error_map = new HashMap();
            Map error_desc_map = new HashMap<>();
            String error_desc = "exception occured:"+e.getMessage();
            error_desc_map.put("error","Exception");
            error_desc_map.put("error_msg",error_desc);
            error_map.put("result",PWEStaticDataModel.TXN_FAILED_CODE);
            error_map.put("payment_response",error_desc_map);
            channel_result.success(error_map);
        }
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(data != null ) {
            if(requestCode==PWEStaticDataModel.PWE_REQUEST_CODE)
            {
                start_payment=true;
                JSONObject response = new JSONObject();
                Map error_map = new HashMap<>();
                if(data != null ) {
                    String result = data.getStringExtra("result");
                    String payment_response = data.getStringExtra("payment_response");
                    try {
                        JSONObject obj = new JSONObject(payment_response);
                        response.put("result", result);
                        response.put("payment_response", obj);
                        channel_result.success(JsonConverter.convertToMap(response));
                    }catch (Exception e){
                        Map error_desc_map = new HashMap<>();
                        error_desc_map.put("error",result);
                        error_desc_map.put("error_msg",payment_response);
                        error_map.put("result",result);
                        error_map.put("payment_response",error_desc_map);
                        channel_result.success(error_map);
                    }
                }else{
                    Map error_desc_map = new HashMap<>();
                    String error_desc = "Empty payment response";
                    error_desc_map.put("error","Empty error");
                    error_desc_map.put("error_msg",error_desc);
                    error_map.put("result","payment_failed");
                    error_map.put("payment_response",error_desc_map);
                    channel_result.success(error_map);
                }
            }else
            {
                super.onActivityResult(requestCode, resultCode, data);
            }
        }
    }
}
