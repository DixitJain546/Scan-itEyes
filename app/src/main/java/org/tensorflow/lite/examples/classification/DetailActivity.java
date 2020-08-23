package org.tensorflow.lite.examples.classification;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import butterknife.BindView;
import butterknife.ButterKnife;

public class DetailActivity extends AppCompatActivity {
    ArrayList<HashMap<String,String>> arrayList=new ArrayList<>();
    @BindView(R.id.imageView2)
    ImageView imageView;
    @BindView(R.id.textViewDetected)
    TextView textViewDetected;
    @BindView(R.id.imageViewDetected)
    ImageView imageViewDetected;
    @BindView(R.id.textViewTips)
    TextView textViewTips;
    @BindView(R.id.rvMaterial)
    RecyclerView rvMaterial;
    String detect;
    String picUrl="http://192.168.1.107/Scan-itEyes/resources/";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);
        ButterKnife.bind(this);
        Bundle intent=getIntent().getExtras();
        detect=intent.getString("DetectedItem");
        textViewDetected.setText(detect);
        Toast.makeText(DetailActivity.this,"Detected : "+detect,Toast.LENGTH_LONG).show();
        fetchMaterial();
        imageView.setOnClickListener(v -> onBackPressed());
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent intent=new Intent(DetailActivity.this,ClassifierActivity.class);
        startActivity(intent);
    }

    public void fetchMaterial()
    {
        StringRequest request=new StringRequest(Request.Method.POST, "http://192.168.1.107/Scan-itEyes/api/api_fetch_object.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonObject = new JSONObject(response);
                    if (jsonObject.getString("success").equals("1")) {
                        JSONArray jsonArray = jsonObject.getJSONArray("object_data");
                        for (int i = 0; i < jsonArray.length(); i++) {
                            JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                            HashMap<String, String> hashMap = new HashMap<>();
                            hashMap.put("O_Name", jsonObject1.getString("O_Name"));
                            hashMap.put("Tips", jsonObject1.getString("Tips"));
                            hashMap.put("M_ID", jsonObject1.getString("M_ID"));
                            hashMap.put("M_Name", jsonObject1.getString("M_Name"));
                            hashMap.put("Survival", jsonObject1.getString("Survival"));
                            arrayList.add(hashMap);
                            DetailAdapter detailAdapter=new DetailAdapter(DetailActivity.this,arrayList);
                            LinearLayoutManager linearLayoutManager=new LinearLayoutManager(DetailActivity.this);
                            linearLayoutManager.setOrientation(RecyclerView.HORIZONTAL);
                            rvMaterial.setLayoutManager(linearLayoutManager);
                            rvMaterial.setAdapter(detailAdapter);
                        }
                        if(detect.equals("Door Knob/handle")) {
                            picUrl = picUrl +"DoorKnob.png";
                            Glide.with(DetailActivity.this).load(picUrl).into(imageViewDetected);
                        }
                        else
                        {
                            picUrl = picUrl + detect + ".png";
                            Glide.with(DetailActivity.this).load(picUrl).into(imageViewDetected);
                        }
                        textViewTips.setText(arrayList.get(0).get("Tips"));

                    } else {
                        Toast.makeText(DetailActivity.this, "No Data", Toast.LENGTH_LONG).show();
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(DetailActivity.this, error.getMessage(), Toast.LENGTH_LONG).show();
            }

    }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> map=new HashMap<>();
                map.put("O_Name",detect);
                return map;
            }
        };

        RequestQueue queue = Volley.newRequestQueue(DetailActivity.this);
        queue.add(request);
    }
}