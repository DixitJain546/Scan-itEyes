package org.tensorflow.lite.examples.classification;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        Thread thread=new Thread(){
            @Override
            public void run() {
                try {
                    Thread.sleep(2000);
                }
                catch (Exception e)
                {
                    System.out.print(e);
                }
                finally {
                    Intent intent=new Intent(SplashActivity.this,ClassifierActivity.class);
                    startActivity(intent);
                }
            }
        };
        thread.start();

    }
    @Override
    protected void onPause() {
        super.onPause();
        finish();

    }
}
