package org.tensorflow.lite.examples.classification;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import butterknife.BindView;
import butterknife.ButterKnife;

public class MaterialActivity extends AppCompatActivity {
    @BindView(R.id.imageView3)
    ImageView imageView;
    @BindView(R.id.textViewMaterial)
    TextView textViewMaterial;
    @BindView(R.id.textViewSurvival)
    TextView textViewSurvival;
    @BindView(R.id.textViewExamples)
    TextView textViewExamples;
    @BindView(R.id.textViewSanitize)
    TextView textViewSanitize;
    String Material;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_material);
        ButterKnife.bind(this);
        Bundle extras=getIntent().getExtras();
        Material=extras.getString("MaterialName");
        Toast.makeText(this,"Material : "+Material,Toast.LENGTH_LONG).show();
        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });
        fetchMaterial();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent i=new Intent(MaterialActivity.this,DetailActivity.class);
        startActivity(i);
    }

    void fetchMaterial()
    {
        textViewMaterial.setText(Material);
        HashMap<String,String> hm=new HashMap<>();
        StringRequest request=new StringRequest(Request.Method.POST, "http://192.168.1.107/Scan-itEyes/api/api_fetch_material.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONObject jsonObject=new JSONObject(response);
                    if(jsonObject.getString("success").equals("1")){
                        JSONArray jsonArray=jsonObject.getJSONArray("material_data");
                        for(int i=0;i<jsonArray.length();i++) {
                            JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                            hm.put("M_Name",jsonObject1.getString("M_Name"));
                            hm.put("Survival",jsonObject1.getString("Survival"));
                            hm.put("Example",jsonObject1.getString("Example"));
                            hm.put("Sanitize",jsonObject1.getString("Sanitize"));
                        }
                    }
                    textViewSurvival.setText(hm.get("Survival"));
                    textViewExamples.setText(hm.get("Example"));
                    textViewSanitize.setText(hm.get("Sanitize"));
                }
                catch (JSONException e){
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> map=new HashMap<>();
                map.put("M_Name",Material);
                return map;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(MaterialActivity.this);
        requestQueue.add(request);
    }
}